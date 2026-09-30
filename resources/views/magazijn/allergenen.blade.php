<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Overzicht Allergenen
        </h2>
    </x-slot>

    @if (count($allergenen) === 0)
        <meta http-equiv="refresh" content="4;url={{ route('magazijn.overzicht') }}">
    @endif

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">

                <div class="mb-4">
                    <p>Naam: {{ $productInfo['Naam'] }}</p>
                    <p>Barcode: {{ $productInfo['Barcode'] }}</p>
                </div>

                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="border-b">
                            <th class="p-2">Naam</th>
                            <th class="p-2">Omschrijving</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($allergenen as $allergeen)
                            <tr class="border-b">
                                <td class="p-2">{{ $allergeen['Naam'] }}</td>
                                <td class="p-2">{{ $allergeen['Omschrijving'] }}</td>
                            </tr>
                        @empty
                            <tr class="border-b">
                                <td class="p-2" colspan="2">In dit product zitten geen stoffen die een allergische reactie kunnen veroorzaken</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</x-app-layout>
