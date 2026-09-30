<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Overzicht Magazijn Jamin
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="border-b">
                            <th class="p-2">Barcode</th>
                            <th class="p-2">Naam</th>
                            <th class="p-2">Verpakkingseenheid</th>
                            <th class="p-2">Aantal aanwezig</th>
                            <th class="p-2">Allergenen Info</th>
                            <th class="p-2">Leverantie Info</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($producten as $product)
                            <tr class="border-b">
                                <td class="p-2">{{ $product['Barcode'] }}</td>
                                <td class="p-2">{{ $product['Naam'] }}</td>
                                <td class="p-2">{{ $product['VerpakkingsEenheidInKilogram'] }} kg</td>
                                <td class="p-2">{{ $product['AantalAanwezig'] ?? '-' }}</td>
                                <td class="p-2">
                                    <a href="{{ route('magazijn.allergenen', $product['Id']) }}" class="text-red-600 font-bold" title="Allergenen Info">
                                        &#10060;
                                    </a>
                                </td>
                                <td class="p-2">
                                    <a href="{{ route('magazijn.levering', $product['Id']) }}" class="text-blue-600 font-bold text-xl" title="Leverantie Info">
                                        ?
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</x-app-layout>
