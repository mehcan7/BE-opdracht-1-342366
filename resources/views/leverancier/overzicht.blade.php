<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Overzicht leveranciers
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="border-b">
                            <th class="p-2">Naam</th>
                            <th class="p-2">Contactpersoon</th>
                            <th class="p-2">Leveranciernummer</th>
                            <th class="p-2">Mobiel</th>
                            <th class="p-2">Aantal verschillende producten</th>
                            <th class="p-2">Toon producten</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($leveranciers as $leverancier)
                            <tr class="border-b">
                                <td class="p-2">{{ $leverancier['Naam'] }}</td>
                                <td class="p-2">{{ $leverancier['ContactPersoon'] }}</td>
                                <td class="p-2">{{ $leverancier['LeverancierNummer'] }}</td>
                                <td class="p-2">{{ $leverancier['Mobiel'] }}</td>
                                <td class="p-2">{{ $leverancier['AantalVerschillendeProducten'] }}</td>
                                <td class="p-2">
                                    <a href="{{ route('leverancier.producten', $leverancier['Id']) }}" class="text-xl" title="Toon producten">
                                        &#128230;
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

                <div class="mt-4 flex justify-end">
                    <a href="{{ route('dashboard') }}" class="px-4 py-2 border rounded hover:bg-gray-100">Home</a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
