Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7629540E0
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 07:08:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="::1"
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6SKsz6M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlVPh4hKPz2ysB
	for <lists+linux-aspeed@lfdr.de>; Fri, 16 Aug 2024 15:08:24 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p6SKsz6M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlVPb0nj7z2xJV
	for <linux-aspeed@lists.ozlabs.org>; Fri, 16 Aug 2024 15:08:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4A8062055;
	Fri, 16 Aug 2024 05:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7348EC32782;
	Fri, 16 Aug 2024 05:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723784893;
	bh=7kyktabdKuv9mFqwTvNJijCo/dbL3dM/DaUNyZmR8CA=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=p6SKsz6MPsj/0eg2UHoM4j/PLZDDjUaKJ3w2YUUGOEY+rjMO1XeXbsGWhFEruoGSa
	 qR0883WuD+8T1HYGF7/6FsIbkA0Zr3a4XQ9xsNl44HiD3ePg9cBJFvwYAxOd80Nkv2
	 9uhqU+mTa6sMOMagS+j+bQC9mo9gK/wZHMxsgXuogyGTlvwgFqZOGoVc4MZZUjGke6
	 XquGZ9KMBfeA821X6cT+F4CoUSfRgfli+UMHpX1suMBCpeh9UeiZRO+8u/vwI6sZZ9
	 iP+nZvapGZhEEPcbnawSp6TfAYxlbGzxGZwwizx1Q6tSVmcotC/JDbjxcfrwqICgaD
	 UCV40RzaEscZw==
Message-ID: <aa3a1835-19e0-43a5-b6a4-4a7e531f3b2e@kernel.org>
Date: Fri, 16 Aug 2024 07:08:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuimhjogW1BBVENIIHYxIDA4LzEwXSBhcm02NDogZHRzOiBh?=
 =?UTF-8?Q?speed=3A_Add_initial_AST27XX_device_tree?=
To: Kevin Chen <kevin_chen@aspeedtech.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andrew@codeconstruct.com.au"
 <andrew@codeconstruct.com.au>, "lee@kernel.org" <lee@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "olof@lixom.net" <olof@lixom.net>, "soc@kernel.org" <soc@kernel.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "u-kumar1@ti.com" <u-kumar1@ti.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 BMC-SW <BMC-SW@aspeedtech.com>
References: <20240726110355.2181563-1-kevin_chen@aspeedtech.com>
 <20240726110355.2181563-9-kevin_chen@aspeedtech.com>
 <b6be1531-d8e2-44d1-a81a-6db8f9ae4ad4@kernel.org>
 <PSAPR06MB4949EC0D0E0DA16F50BBF40489802@PSAPR06MB4949.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <PSAPR06MB4949EC0D0E0DA16F50BBF40489802@PSAPR06MB4949.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On 15/08/2024 07:50, Kevin Chen wrote:
>>> diff --git a/arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi b/arch/arm64/b=
oot/dts/aspeed/aspeed-g7.dtsi
>>> new file mode 100644
>>> index 000000000000..858ab95251e4
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi
>>> @@ -0,0 +1,217 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +#include <dt-bindings/clock/aspeed,ast2700-clk.h>
>>> +#include <dt-bindings/reset/aspeed,ast2700-reset.h>
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <dt-bindings/interrupt-controller/aspeed-scu-ic.h>
>>> +
>>> +/ {
>>> +     model =3D "Aspeed BMC";
>>
>> Model of what? No, drop.
> Can I change to "model =3D "AST2700 EVB""

Model of what? No, it does not make sense here.


=2E.


>>> +
>>> +             uart12: serial@14c33b00 {
>>> +                     compatible =3D "ns16550a";
>>> +                     reg =3D <0x0 0x14c33b00 0x0 0x100>;
>>> +                     reg-shift =3D <2>;
>>> +                     reg-io-width =3D <4>;
>>> +                     clocks =3D <&syscon1 SCU1_CLK_GATE_UART12CLK>;
>>> +                     no-loopback-test;
>>> +                     pinctrl-names =3D "default";
>>
>> What is this?
> BMC uart using in uart12 in soc1.

No, that line. pinctrl-names do not make sense here without values.

>=20
>>
>>> +             };
>>> +     };
>>> +};
>>> +
>=20
> --
> Best Regards,
> Kevin. Chen
> ________________________________
> =E5=AF=84=E4=BB=B6=E8=80=85: Krzysztof Kozlowski <krzk@kernel.org>
> =E5=AF=84=E4=BB=B6=E6=97=A5=E6=9C=9F: 2024=E5=B9=B47=E6=9C=8826=E6=97=A5=
 =E4=B8=8B=E5=8D=88 07:19
> =E6=94=B6=E4=BB=B6=E8=80=85: Kevin Chen <kevin_chen@aspeedtech.com>; ro=
bh@kernel.org <robh@kernel.org>; krzk+dt@kernel.org <krzk+dt@kernel.org>;=
 conor+dt@kernel.org <conor+dt@kernel.org>; joel@jms.id.au <joel@jms.id.a=
u>; andrew@codeconstruct.com.au <andrew@codeconstruct.com.au>; lee@kernel=
=2Eorg <lee@kernel.org>; catalin.marinas@arm.com <catalin.marinas@arm.com=
>; will@kernel.org <will@kernel.org>; arnd@arndb.de <arnd@arndb.de>; olof=
@lixom.net <olof@lixom.net>; soc@kernel.org <soc@kernel.org>; mturquette@=
baylibre.com <mturquette@baylibre.com>; sboyd@kernel.org <sboyd@kernel.or=
g>; p.zabel@pengutronix.de <p.zabel@pengutronix.de>; quic_bjorande@quicin=
c.com <quic_bjorande@quicinc.com>; geert+renesas@glider.be <geert+renesas=
@glider.be>; dmitry.baryshkov@linaro.org <dmitry.baryshkov@linaro.org>; s=
hawnguo@kernel.org <shawnguo@kernel.org>; neil.armstrong@linaro.org <neil=
=2Earmstrong@linaro.org>; m.szyprowski@samsung.com <m.szyprowski@samsung.=
com>; nfraprado@collabora.com <nfraprado@collabora.com>; u-kumar1@ti.com =
<u-kumar1@ti.com>; devicetree@vger.kernel.org <devicetree@vger.kernel.org=
>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@lists.infradead=
=2Eorg>; linux-aspeed@lists.ozlabs.org <linux-aspeed@lists.ozlabs.org>; l=
inux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; linux-clk@vge=
r.kernel.org <linux-clk@vger.kernel.org>
> =E4=B8=BB=E6=97=A8: Re: [PATCH v1 08/10] arm64: dts: aspeed: Add initia=
l AST27XX device tree
>=20

Why do you quote my email twice?


=2E..

>> +             uart12: serial@14c33b00 {
>> +                     compatible =3D "ns16550a";
>> +                     reg =3D <0x0 0x14c33b00 0x0 0x100>;
>> +                     reg-shift =3D <2>;
>> +                     reg-io-width =3D <4>;
>> +                     clocks =3D <&syscon1 SCU1_CLK_GATE_UART12CLK>;
>> +                     no-loopback-test;
>> +                     pinctrl-names =3D "default";
>=20
> What is this?
>=20
>> +             };
>> +     };
>> +};
>> +
>=20
> Best regards,
> Krzysztof
>=20
> ************* Email Confidentiality Notice ********************
> =E5=85=8D=E8=B2=AC=E8=81=B2=E6=98=8E:
> =E6=9C=AC=E4=BF=A1=E4=BB=B6(=E6=88=96=E5=85=B6=E9=99=84=E4=BB=B6)=E5=8F=
=AF=E8=83=BD=E5=8C=85=E5=90=AB=E6=A9=9F=E5=AF=86=E8=B3=87=E8=A8=8A=EF=BC=8C=
=E4=B8=A6=E5=8F=97=E6=B3=95=E5=BE=8B=E4=BF=9D=E8=AD=B7=E3=80=82=E5=A6=82 =
=E5=8F=B0=E7=AB=AF=E9=9D=9E=E6=8C=87=E5=AE=9A=E4=B9=8B=E6=94=B6=E4=BB=B6=E8=
=80=85=EF=BC=8C=E8=AB=8B=E4=BB=A5=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=E9=80=
=9A=E7=9F=A5=E6=9C=AC=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=E4=B9=8B=E7=99=BC=
=E9=80=81=E8=80=85, =E4=B8=A6=E8=AB=8B=E7=AB=8B=E5=8D=B3=E5=88=AA=E9=99=A4=
=E6=9C=AC=E9=9B=BB=E5=AD=90=E9=83=B5=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=
=BB=B6=E5=92=8C=E9=8A=B7=E6=AF=80=E6=89=80=E6=9C=89=E8=A4=87=E5=8D=B0=E4=BB=
=B6=E3=80=82=E8=AC=9D=E8=AC=9D=E6=82=A8=E7=9A=84=E5=90=88=E4=BD=9C!
>=20
> DISCLAIMER:
> This message (and any attachments) may contain legally privileged and/o=
r other confidential information. If you have received it in error, pleas=
e notify the sender by reply e-mail and immediately delete the e-mail and=
 any attachments without copying or disclosing the contents. Thank you.

Maybe I am the intended recipient of your message, maybe not. I don't
want to have any legal questions regarding upstream, public
collaboration, thus probably I should just remove your messages.

Please talk with your IT that such disclaimers in open-source are not
desired (and maybe even harmful).
If you do not understand why, please also see:
https://www.youtube.com/live/fMeH7wqOwXA?si=3DGY7igfbda6vnjXlJ&t=3D835

If you need to go around company SMTP server, then consider using b4
web-relay: https://b4.docs.kernel.org/en/latest/contributor/send.html

Please be informed that by responding to this email you agree that all
communications from you and/or your company is made public. In other
words, all messages originating from you and/or your company will be
made public.

Best regards,
Krzysztof

