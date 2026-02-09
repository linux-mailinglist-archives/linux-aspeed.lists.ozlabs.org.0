Return-Path: <linux-aspeed+bounces-3501-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G0AEtV8iWnk9wQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3501-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 07:21:09 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E367A10C00D
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 07:21:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8ZMM4WVnz2yFm;
	Mon, 09 Feb 2026 17:21:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770618063;
	cv=none; b=m8QvwScfIz2w6wd5OC6HOVix4q11uT/i3lnabSw6xbVygWKOQzBFzxSCs2kB+ZbETNin9GuuQC6JV5svHP8bz7yv0U6qyqDhyHNMcWI5otUai7WvZ3Cl38DHW18e6tVY3fwvJq8p3I28mpPullA3+K6EDKdnHMIraD8G0Dxn8M3d0+E20hUFlpR+1SOkRptsB9/I+4nLEaLtAlmTg+iI0kX86fxx4OXQhlbKXOjQCRIDc09k1kTPZkONThiSCT0awSAwKrZq0/wbSK4p0atty0wxIbHcgREOIeW3NgSujy1X+ZmsudUMyh1fDTOKRcP1BfloeAfxkmDLa1olINd7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770618063; c=relaxed/relaxed;
	bh=y1YXR4/Tyv9LUkuxa8hny85fia7ireYDpMIuGkyTJqA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jo0TmTrCF38NsiEvwTrrzYjdaFqy1tAUyQO/hKsaMT7CYFMo82/282uD/RYNAy2WTr0gO1+PdkGE+As2pIqgHSz8cB+EPLl4UikeqBu+ZnwZLEM93RTNP5uUtexo98DQUiV+7iKXtlGEQtIkfuWJFZb5dHzFZSBJrkc1q23D4WaHU784F9IHvuoRIaGCvK3jxO047Xhmq1D8A1u7Km7vYN/gsbU5JdMVECRNsaNtNdOqkUs8X5WoijLVxm8gV69g1hBK9Y/2JcGArEqOWNIxdKc6EyPvcQ+SpLeBi+BazM741hj9vqRNMX/WURHMLEEtZHH/tPCpSo28P5UKMwcENA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bMcV/fEZ; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bMcV/fEZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8ZML2mCXz2xHX
	for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Feb 2026 17:21:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770618061;
	bh=y1YXR4/Tyv9LUkuxa8hny85fia7ireYDpMIuGkyTJqA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bMcV/fEZkzK7rGBH/FYv8Y0leVnfLwAoi4PIVFj+oNgOgyq9TVRwGUSwbe1V7Ruwf
	 einFWiOE/WXcWYyuDnJXLbqXH6nMUAq2DNakHJZZIzCtgUn9I7qEDq8YmpIso9VVt6
	 ddWSmTMEKtJ2S6bpOfuGE/ummOa236s06qQrQRUR36GxZmRiNAHzunqx9wzc0onDsq
	 +zxuUjOEUzdz2VGmytqSGeenN6rEPINEmVzDa43X8X3UyGHJrm2bCShaAjPkqWfNtm
	 0n8qZBXTHHWc+CQVu7mnw0wrK2F8ReiMQs/Gnjql4CWjsV5Bzu2srl1a5h4CnmBsgi
	 uWrYSuG/TM1lg==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 109B06024E;
	Mon,  9 Feb 2026 14:21:01 +0800 (AWST)
Message-ID: <73c63bc2f5eaae2c931a4ced1462024bd5a24237.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 5/7] ARM: dts: aspeed: yosemite5: Correct power
 monitor shunt resistor
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>
Date: Mon, 09 Feb 2026 16:51:00 +1030
In-Reply-To: <20260130-yv5_revise_dts-v4-5-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
	 <20260130-yv5_revise_dts-v4-5-4d924455f3a7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3501-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,jms.id.au];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:kevin.tung.openbmc@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amithash@meta.com,m:Kevin.Tung@quantatw.com,m:Ken.Chen@quantatw.com,m:Leo-Yang@quantatw.com,m:Jackson.Liu@quantatw.com,m:kevintungopenbmc@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[0.0.0.41:email,0.0.0.21:email,0.0.0.57:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim,0.0.0.43:email,0.0.0.44:email,0.0.0.59:email,0.0.0.40:email,5b:email,0.0.0.42:email,0.0.0.58:email]
X-Rspamd-Queue-Id: E367A10C00D
X-Rspamd-Action: no action

Hi Kevin,

On Fri, 2026-01-30 at 16:20 +0800, Kevin Tung wrote:
> The shunt resistor value defined in the DTS was incorrect and did not
> reflect the resistor value populated on the board. As a result, power
> and current readings derived from this value were inaccurate.

Okay, but how did it come to be incorrect in the devicetree? Was the
documentation wrong and so someone entered the wrong value? Was the
documentation correct but there was a misunderstanding? Did the
hardware design change and the devicetree is now just inappropriate for
your needs?

Essentially, what's preventing this from happening again?

>=20
> This change=C2=A0
>=20

I'd rather you rephrase this to avoid using "This change ...".
Hopefully the commit message always refers to its change.

Generally, please write in the imperative mood (see [1])

[1]: https://docs.kernel.org/process/submitting-patches.html#describe-your-=
changes

> updates the DTS to use the correct shunt resistor value
> according to the hardware design, restoring accurate power and current
> measurements.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 +++=
++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> index 84d3731b17f7c7c87338672bbcc859de2b89b722..524597a81365ef10cd03b67d3=
5eeb88a965cbe0a 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -415,7 +415,7 @@ power-sensor@42 {
> =C2=A0	power-monitor@43 {
> =C2=A0		compatible =3D "lltc,ltc4287";
> =C2=A0		reg =3D <0x43>;
> -		shunt-resistor-micro-ohms =3D <250>;
> +		shunt-resistor-micro-ohms =3D <100>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-sensor@44 {
> @@ -461,25 +461,25 @@ eeprom@57 {
> =C2=A0	power-monitor@58 {
> =C2=A0		compatible =3D "renesas,isl28022";
> =C2=A0		reg =3D <0x58>;
> -		shunt-resistor-micro-ohms =3D <1000>;
> +		shunt-resistor-micro-ohms =3D <10000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-monitor@59 {
> =C2=A0		compatible =3D "renesas,isl28022";
> =C2=A0		reg =3D <0x59>;
> -		shunt-resistor-micro-ohms =3D <1000>;
> +		shunt-resistor-micro-ohms =3D <10000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-monitor@5a {
> =C2=A0		compatible =3D "renesas,isl28022";
> =C2=A0		reg =3D <0x5a>;
> -		shunt-resistor-micro-ohms =3D <1000>;
> +		shunt-resistor-micro-ohms =3D <10000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-monitor@5b {
> =C2=A0		compatible =3D "renesas,isl28022";
> =C2=A0		reg =3D <0x5b>;
> -		shunt-resistor-micro-ohms =3D <1000>;
> +		shunt-resistor-micro-ohms =3D <10000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	psu@5c {
> @@ -723,13 +723,13 @@ gpio-expander@21 {
> =C2=A0	power-sensor@40 {
> =C2=A0		compatible =3D "ti,ina230";
> =C2=A0		reg =3D <0x40>;
> -		shunt-resistor =3D <2000>;
> +		shunt-resistor =3D <1000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-sensor@41 {
> =C2=A0		compatible =3D "ti,ina230";
> =C2=A0		reg =3D <0x41>;
> -		shunt-resistor =3D <2000>;
> +		shunt-resistor =3D <1000>;
> =C2=A0	};
> =C2=A0
> =C2=A0	power-sensor@42 {

The way the commit message is written suggests it was just one shunt
resistor, but that's clearly not the case.

Andrew

