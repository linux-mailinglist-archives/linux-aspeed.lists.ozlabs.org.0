Return-Path: <linux-aspeed+bounces-4060-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIJDJFf5CmpZ+QQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4060-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:34:47 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CF656BA54
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 13:34:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJwh35mNyz2xpn;
	Mon, 18 May 2026 21:34:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779104083;
	cv=none; b=TCBkLHsnWyKYE4N0lIH+oqNtzygZO4SzKIswNVHX8AZo51Vkk3kiDCtcChwZW52ppoBtYquwmizBog1YTPmx6AUOeo4TD2G5aEw/EbNPIB8c7E1fk3el4cpQUC9aP1KCs2VpZyskTv0rqDum800+x8s90R9z6XBot9fCm4KE8D9msLnxXUusSPL3WsFSoZIl9gqNtzTEESjljdwU3ZBtUALKbUMLIm3ineKjHMJ1+/OHLvlYed8ZCfkXsjKrd80qrg6EbuB1TFIAGy+c1Rco7B7cyKhwEX19TJT3FLjC1LnNBYOpT6LQLx1kdKjbw8te796oJO1MdjWsOnTm1Awc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779104083; c=relaxed/relaxed;
	bh=REqrAQY4uKlWtuT6Rjt1VuMQRCebk3yBOhWbO+UCL2E=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G6wHk0eDPhK0CDQm7cu4TC09dGGK4yYDh6ijOUU6g2a689Nynpp0eAHke/wCAnTnLnrdrtKx8YHtLEgJdHnsCwBZU8bjSrLPMjHBZ9v6slQwyq7176Xa3INRCv6iVGbmI+A7ZGM9MynzdASzT8bTAy7rQPj4WDEbNnENFtHByLP199Ig15qtysGjmVnU48nNljl4pcKCIzvD8DEE6k229R3Jd0/rGqmAbPD82mn+f/9gRToTowzGDf32wn+DXJeItqcdIbnyzjhi7/jC9XdU9pl+otwERR9qDUlVTB7HKBOQhQLpJRFN1ybyjcSN2rgYeChUyEEFPfLuOskugcTF9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GPMPfB7w; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GPMPfB7w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJwh22Vy3z2xRw
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 21:34:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779104081;
	bh=REqrAQY4uKlWtuT6Rjt1VuMQRCebk3yBOhWbO+UCL2E=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=GPMPfB7wp23Hpil/z8xfSFoOpHRkAS89KniFB1Qm8LAc55RA2/mOH+Ml0vgY0Rzqa
	 MpGRWJqivCpy/NgcrDDRXAhnji4mrEtMcdZtp/Ck2wW6/xtIfOVB60P7pQVcKRZnho
	 wkIE3wv7SfE8TvNJPXwPSe3rXCJOT940liRpEMJDnEs9XCOgtRGi3reo6suvy28U1w
	 +ce5kkr0ybrEYdLuxl1DtArMQhNdWcwM6KzLPeBtmMKPWhRn2bkFjRYiLE6cc+9nRH
	 8uMvJJz8qv9kgzVv176PxqOuCvNO+nlmCpraVOmBSP2c/jDy/4Totf5hrB6Pjqb6uE
	 izsQ1G5TOXa4w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 381E36024D;
	Mon, 18 May 2026 19:34:41 +0800 (AWST)
Message-ID: <642d8a490626d4e62473baa37bef04ce85bddb96.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 7/7] ARM: dts: aspeed: system1: DTS updates
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, eajames@linux.ibm.com,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 21:04:40 +0930
In-Reply-To: <20260421224551.1611818-8-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
	 <20260421224551.1611818-8-ninad@linux.ibm.com>
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
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,WEIRD_QUOTING
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 31CF656BA54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4060-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ninad@linux.ibm.com,m:eajames@linux.ibm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Action: no action

Hi Ninad,

On Tue, 2026-04-21 at 17:45 -0500, Ninad Palsule wrote:
> - Removed SGPIO node as not in use anymore.
> - Updated chassis power related pins as per the new hardware design

Can you please take a look at the discussion in the thread linked
below, and consider some of the approaches outlined there?

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

I'd like to avoid a stream of backwards-incompatible changes due to
platform design changes where we can.

Andrew

>=20
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 10 ++--------
> =C2=A01 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index 91c317267d6b..d7a934fe5860 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -424,7 +424,7 @@ &pinctrl_gpiol6_unbiased
> =C2=A0	/*E0-E7*/	"","","","","","","","",
> =C2=A0	/*F0-F7*/	"","","","","","","","",
> =C2=A0	/*G0-G7*/	"","","","","","","","",
> -	/*H0-H7*/	"","","","","","","","",
> +	/*H0-H7*/	"power-chassis-good","power-chassis-reboot","","","","","",""=
,
> =C2=A0	/*I0-I7*/	"","","","","","","","",
> =C2=A0	/*J0-J7*/	"","","","","","","","",
> =C2=A0	/*K0-K7*/	"","","","","","","","",
> @@ -440,7 +440,7 @@ &pinctrl_gpiol6_unbiased
> =C2=A0	/*U0-U7*/	"","","","","","","","",
> =C2=A0	/*V0-V7*/	"","rtc-battery-voltage-read-enable","","power-chassis-c=
ontrol","","","","",
> =C2=A0	/*W0-W7*/	"","","","","","","","",
> -	/*X0-X7*/	"fpga-pgood","power-chassis-good","pch-pgood","","","","","",
> +	/*X0-X7*/	"fpga-pgood","","pch-pgood","","","","","",
> =C2=A0	/*Y0-Y7*/	"","","","","","","","",
> =C2=A0	/*Z0-Z7*/	"","","","","","","","";
> =C2=A0
> @@ -486,12 +486,6 @@ &emmc {
> =C2=A0	clk-phase-mmc-hs200 =3D <180>, <180>;
> =C2=A0};
> =C2=A0
> -&sgpiom0 {
> -	status =3D "okay";
> -	ngpios =3D <128>;
> -	bus-frequency =3D <500000>;
> -};
> -
> =C2=A0&ibt {
> =C2=A0	status =3D "okay";
> =C2=A0};

