Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB7A945193
	for <lists+linux-aspeed@lfdr.de>; Thu,  1 Aug 2024 19:37:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LpOLXcne;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZbkh4vfgz3dTx
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 03:37:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LpOLXcne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZbkb5KyLz3cmk
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 03:37:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49F2F62927
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2024 17:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED16C4AF0E
	for <linux-aspeed@lists.ozlabs.org>; Thu,  1 Aug 2024 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722533829;
	bh=HS/42EjkDCaT5ky7ooKDb1UPOfOyGpi5Ob5b/D63nkg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LpOLXcneIiSzNSHZdWD4JIwwk7X0B1k4+nPt1nVjDSRTYJLcSTAbonrv3vyzS+2b6
	 8c+b4mZ02LAa/rUurNUVNt31RxpMzJI1orsDfXcQsxzF9K6crSvPKPLQRhJ34YerUh
	 loIDOd+PUxBODX4FdJYLqnOwpSnUjo74y26OWzEh5jGkNctcbkemt8YuY/muhKcxhr
	 UjtityFUSIm5RqG0E6G7Y6eUCZjonOuVngSK/h3iVOHFC/79kItUmRWHKVxCdg3ON+
	 D9GAG/ju6gKHkLgT6cBFK3rG+3UwcGY5DZRMuXotJVeNiwH+hPN09wACr/PW+SoXMX
	 7YThGnyDaRV1g==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f149845fbaso36572441fa.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 01 Aug 2024 10:37:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVl5T7jr2MqMz4mE+M8Er+1cS2sPpoFPOrW5u3ZhKcp0w3xxYtT6UN5k8ktx15YQ0steA+Ilo5C/lDK0DTqnN2Dv6Ofeyyby2C1DjKUQ==
X-Gm-Message-State: AOJu0YyTghrLzQVIb14a051TyXQLxu+hRXgzMqunMHwQSuuGY7O77tp6
	69VYufY2tYSUOVNQNxm5q1FBORmgopH/ZcFnnUnzcvCBo/H0JzTtxXMqmTAojYGiVYZMeyLZHp0
	r0ns8ydgYzgj+DNTBJEF6DvInvA==
X-Google-Smtp-Source: AGHT+IENZh2GH3qb7gMlOtf9zztyewJ9vbYF8/1WMokwYLp/xVLgsAWVFPEVuwRazHpSrJuGlE+TFSFEM+CoAig//XM=
X-Received: by 2002:a2e:9199:0:b0:2ef:1f68:ead5 with SMTP id
 38308e7fff4ca-2f15aaaa921mr7481621fa.26.1722533827252; Thu, 01 Aug 2024
 10:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240731214737.986010-1-ninad@linux.ibm.com> <172252600790.120672.12772438670145461296.robh@kernel.org>
 <4d5b8958-2d33-42df-ac97-82bb63fdff38@linux.ibm.com>
In-Reply-To: <4d5b8958-2d33-42df-ac97-82bb63fdff38@linux.ibm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 1 Aug 2024 11:36:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLd8Xcj7gD=WKrt8ygYHb3jNpvxof5yFAPPydiRCPv0eQ@mail.gmail.com>
Message-ID: <CAL_JsqLd8Xcj7gD=WKrt8ygYHb3jNpvxof5yFAPPydiRCPv0eQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] ARM: dts: aspeed: system1: IBM System1 BMC update
To: Ninad Palsule <ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 1, 2024 at 10:25=E2=80=AFAM Ninad Palsule <ninad@linux.ibm.com>=
 wrote:
>
> Hi Rob,
>
> On 8/1/24 10:29, Rob Herring (Arm) wrote:
> > On Wed, 31 Jul 2024 16:47:28 -0500, Ninad Palsule wrote:
> >> Hello,
> >>
> >> This patch only applies to openbmc/linux. The max31785 pmbus driver
> >> changes are not available in the upstream yet. I will try to send thos=
e
> >> changes upstream.
> >>
> >> Ninad Palsule (1):
> >>    ARM: dts: aspeed: system1: IBM System1 BMC update
> >>
> >>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 96 +++++++++++++++++=
++
> >>   1 file changed, 96 insertions(+)
> >>
> >> --
> >> 2.43.0
> >>
> >>
> >>
> >
> > My bot found new DTB warnings on the .dts files added or changed in thi=
s
> > series.
> >
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warning=
s
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to rep=
ly
> > unless the platform maintainer has comments.
> >
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> >
> >    pip3 install dtschema --upgrade
> >
> >
> > New warnings running 'make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ibm-system1=
.dtb' for 20240731214737.986010-1-ninad@linux.ibm.com:
> >
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a=
000/i2c@380/fan-controller@52/fan@0: failed to match any schema with compat=
ible: ['pmbus-fan']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a=
000/i2c@380/fan-controller@52/fan@1: failed to match any schema with compat=
ible: ['pmbus-fan']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a=
000/i2c@380/fan-controller@52/fan@2: failed to match any schema with compat=
ible: ['pmbus-fan']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a=
000/i2c@380/fan-controller@52/fan@3: failed to match any schema with compat=
ible: ['pmbus-fan']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a=
000/i2c@380/fan-controller@52/fan@4: failed to match any schema with compat=
ible: ['pmbus-fan']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a=
000/i2c@380/fan-controller@54/fan@0: failed to match any schema with compat=
ible: ['pmbus-fan']
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/bus@1e78a=
000/i2c@380/fan-controller@54/fan@1: failed to match any schema with compat=
ible: ['pmbus-fan']
> >
> I have seen these warning. I am not sure how to fix them as it is
> already documented in the following file.
>
> Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt

$ git log -- Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
(END)

Did you mean Documentation/devicetree/bindings/hwmon/max31785.txt? If
so, there is no 'pmbus-fan' in it or anywhere else except aspeed dts
files.

The state of the aspeed dts files is really quite sad. This is a count
of warnings. The first number is total warnings. The second number is
unique warnings (stripping the dtb name so we don't have N warnings
for N boards). The 2nd list is undocumented (by schema) compatibles.

The number of warnings vs. Linus's tree is higher already and we just
started the cycle. That's the wrong direction and in general I see
very little if any effort reducing the warnings for aspeed.

This is all run daily here: https://gitlab.com/robherring/linux-dt/-/jobs

arch/arm/boot/dts/aspeed:3682:635
    184  sbefifo@2400: '#address-cells', '#size-cells' do not match
any of the regexes: 'pinctrl-[0-9]+'
    160  i2cr@20: #address-cells: 1 was expected
     88  eeprom@0: 'size' is a required property
     88  eeprom@0: 'pagesize' is a required property
     88  eeprom@0: 'address-width' is a required property
     70  lpc@1e789000: reg-io-width: 4 is not of type 'object'
     62  kcs@2c: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]=
+'
     62  kcs@28: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]=
+'
     62  kcs@24: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]=
+'
     62  kcs@114: 'clocks' does not match any of the regexes: 'pinctrl-[0-9=
]+'
     45  sram@1e720000: 'ranges' is a required property
     45  sram@1e720000: '#size-cells' is a required property
     45  sram@1e720000: '#address-cells' is a required property
     45  lpc@1e789000: lpc-snoop@90: 'clocks' does not match any of
the regexes: 'pinctrl-[0-9]+'
     25  timer: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+=
'
     25  syscon@1e6e2000: 'smp-memram@180' does not match any of the
regexes: '^interrupt-controller@[0-9a-f]+$',
'^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$',
'^silicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
     25  lpc@1e789000: lpc-snoop@80: 'clocks' does not match any of
the regexes: 'pinctrl-[0-9]+'
     25  ftgmac@1e690000: $nodename:0: 'ftgmac@1e690000' does not
match '^ethernet(@.*)?$'
     25  ftgmac@1e680000: $nodename:0: 'ftgmac@1e680000' does not
match '^ethernet(@.*)?$'
     25  ftgmac@1e670000: $nodename:0: 'ftgmac@1e670000' does not
match '^ethernet(@.*)?$'
     25  ftgmac@1e660000: $nodename:0: 'ftgmac@1e660000' does not
match '^ethernet(@.*)?$'
     25  fsi@1e79b100: compatible: ['aspeed,ast2600-fsi-master',
'fsi-master'] is too long
     25  fsi@1e79b000: compatible: ['aspeed,ast2600-fsi-master',
'fsi-master'] is too long
     25  crypto@1e6fa000: 'aspeed,ahbc' does not match any of the
regexes: 'pinctrl-[0-9]+'
     25  bus@1e600000: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too=
 long
     24  sdc@1e740000: sdhci@1e740200:compatible:
['aspeed,ast2600-sdhci', 'sdhci'] is too long
     24  sdc@1e740000: sdhci@1e740100:compatible:
['aspeed,ast2600-sdhci', 'sdhci'] is too long
     22  spi@60: 'eeprom@0' does not match any of the regexes:
'^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
     22  spi@40: 'eeprom@0' does not match any of the regexes:
'^spi@[0-9a-f]+$', 'pinctrl-[0-9]+'
     22  sbefifo@2400: occ: 'occ-hwmon', 'reg' do not match any of the
regexes: 'pinctrl-[0-9]+'

arch/arm/boot/dts/aspeed:68
['adi, adm1272']
['adm1272']
['adm1275']
['aspeed,ast2400-cf-fsi-master', 'fsi-master']
['aspeed,ast2400-cvic', 'aspeed-cvic']
['aspeed,ast2400-i2c-ic']
['aspeed,ast2400-ibt-bmc']
['aspeed,ast2400-lhc']
['aspeed,ast2400-p2a-ctrl']
['aspeed,ast2400-pwm-tacho']
['aspeed,ast2400-timer']
['aspeed,ast2400-vic']
['aspeed,ast2400-video-engine']
['aspeed,ast2500-cf-fsi-master', 'fsi-master']
['aspeed,ast2500-cvic', 'aspeed-cvic']
['aspeed,ast2500-gfx', 'syscon']
['aspeed,ast2500-i2c-ic']
['aspeed,ast2500-ibt-bmc']
['aspeed,ast2500-lhc']
['aspeed,ast2500-p2a-ctrl']
['aspeed,ast2500-pwm-tacho']
['aspeed,ast2500-scu-ic']
['aspeed,ast2500-sdram-edac']
['aspeed,ast2500-video-engine']
['aspeed,ast2500-xdma']
['aspeed,ast2600-fsi-master', 'fsi-master']
['aspeed,ast2600-gfx', 'syscon']
['aspeed,ast2600-ibt-bmc']
['aspeed,ast2600-lhc']
['aspeed,ast2600-scu-ic0']
['aspeed,ast2600-scu-ic1']
['aspeed,ast2600-sdhci', 'sdhci']
['aspeed,ast2600-sdram-edac', 'syscon']
['aspeed,ast2600-smpmem']
['aspeed,ast2600-timer']
['aspeed,ast2600-udma']
['aspeed,ast2600-video-engine']
['aspeed,ast2600-xdma']
['atmel,at30tse004a']
['dallas,ds3231']
['delta,dps800']
['dps650ab']
['fsi-master-gpio', 'fsi-master']
['fsi-master-hub']
['ibm,bonnell-bmc', 'aspeed,ast2600']
['ibm,fsi-i2c-master']
['ibm,fsi-master-hub']
['ibm,fsi2pib']
['ibm,pca9552']
['infineon,ir35221']
['infineon,pxe1610']
['ipmb-dev']
['isil,isl69260']
['isil,raa229004']
['lm75']
['max31790']
['maxim,max31785a']
['microchip,emc1413']
['mps,mp5023']
['nuvoton,w83795g']
['nvt210']
['nxp,pca9551']
['nxp,pca9552']
['nxp,pca9641']
['pmbus']
['pmbus-fan']
['si,si7021a20']
['ti,ucd90160']
