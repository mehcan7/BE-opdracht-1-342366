<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Levering Informatie
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">

                @php($eersteLevering = $leveringen[0] ?? null)

                @if ($eersteLevering)
                    <div class="mb-4">
                        <p>Naam leverancier: {{ $eersteLevering['NaamLeverancier'] }}</p>
                        <p>Contactpersoon leverancier: {{ $eersteLevering['ContactPersoon'] }}</p>
                        <p>Leveranciernummer: {{ $eersteLevering['LeverancierNummer'] }}</p>
                        <p>Mobiel: {{ $eersteLevering['Mobiel'] }}</p>
                    </div>
                @endif

                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="border-b">
                            <th class="p-2">Naam Product</th>
                            <th class="p-2">Datum laatste levering</th>
                            <th class="p-2">Aantal</th>
                            <th class="p-2">Eerstvolgende levering</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($leveringen as $levering)
                            <tr class="border-b">
                                <td class="p-2">{{ $levering['NaamProduct'] }}</td>
                                <td class="p-2">{{ \Carbon\Carbon::parse($levering['DatumLevering'])->format('d-m-Y') }}</td>
                                <td class="p-2">{{ $levering['Aantal'] }}</td>
                                <td class="p-2">
                                    {{ $levering['DatumEerstVolgendeLevering'] ? \Carbon\Carbon::parse($levering['DatumEerstVolgendeLevering'])->format('d-m-Y') : '-' }}
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</x-app-layout>
