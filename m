Return-Path: <linux-aspeed+bounces-4248-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IqNXFgi2K2oKCgQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4248-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jun 2026 09:32:24 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776446773E0
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jun 2026 09:32:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codeconstruct.com.au header.s=2022a header.b="SB/fmF/U";
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4248-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 2404:9400:21b9:f100::1 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4248-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=codeconstruct.com.au;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gcB6s1H9gz2yhY;
	Fri, 12 Jun 2026 17:32:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781249541;
	cv=none; b=JXlgVhdQEK+YTd8AmHdrP34CHUXsSqQ4Zw8dOktqLt6xwQvoTn1T3AkRHOaO5L8mLcR3ZU1B0rukvzzMtiHtoIvBdTEgfYT13OSm9Gg+C2nsVIlzL3JwotjLepS7DI0nb9/hO1Oo700Nmyk45k+/+Ys+z7a5aVL0ZTEcFrdKjI5wXnILLNfBeNOGlRj7czsaRMVKT4rd+YSTZJ2sAggNvp2GXqpefBMPIHTLb0M8O8poOF5FteA94nS/mfXI3R90GvsLOCxHCIHlL27wKZJMMbyriJM5TkU7yt7dtweWmk0UC4PVtc0Vx3LrOqJ0IzR3z9s85ccXgGmYfLa6gXRkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781249541; c=relaxed/relaxed;
	bh=M6dhvhvt0XbgvJ4MiXah8HcXTJRguTuta/3Cu0D1xfk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tj1Ll2fc2HFWLea/QOHg3DV9A3IvS6KP+9u4hCvdW01nBEh7rvZBMddH2I/3x6rzwBm97JmFegLaghxx6teFDixHwDSs1lKCNdwS/gR25vxO/5jOkpLuPAn3mT0YJvk3pXfaF5FPy/sYlNs37VU9ZPj7+6GYWdV6UJh2WRiTibUjDMSejc+VoTcXFP7TI2i2OHnYhQL+A1KszUrbLKTVkmWUqagFOCEsINBJSQikD9/NXUxeItkmBydoAtEBD8Z5sQmcEtPVRFtuC1sDBtc3BXCVBdEcovj02BU7no1XoMC43CQHAXsz+XNZwtXwYDcA5qfSKeuPPL8nc8ZR6jx3IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SB/fmF/U; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gcB6r3KcTz2yd7
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jun 2026 17:32:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1781249539;
	bh=M6dhvhvt0XbgvJ4MiXah8HcXTJRguTuta/3Cu0D1xfk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SB/fmF/UtpDABvxWo6CkMbOQiVJgrTCJ+PgUHfhT9n2Q6wdkGrGmoPR41KZYXVcmK
	 5GleojLO+whw8ZTjaCgkn+t3/2tdalhZaqEoDZZLkzLYFoBv1B8+0w3mkF7DjIxF84
	 4Djxk5Vm6hqpANJ1Z2ApD6AKiqk8/THeCsPJc3BTJAQDPu+sE/Y4wblmGap3TNvjlj
	 oO2mIhH7qlMCz+jIKB//L+bxPABiE50Erw7flw+qqD9pjHEaExY2qSY6HEe/q5nER3
	 3ZCpWszBKUH9wvaxqdNYD/paemGjIcsZZiQaZWRhFkJ6LD/C+YB7jVednY98G+MM84
	 EuhRD1Ycjov+A==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6FA2860931;
	Fri, 12 Jun 2026 15:32:19 +0800 (AWST)
Message-ID: <e865e2e71a39c86a8afb6af49d9ebcf6839a9a2a.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] ARM: dts: aspeed: g6: Add AST2600 pwm tacho
 controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 12 Jun 2026 17:02:19 +0930
In-Reply-To: <20260612072341.278591-1-gregoire.layet@9elements.com>
References: <20260612072341.278591-1-gregoire.layet@9elements.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4248-lists,linux-aspeed=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:gregoire.layet@9elements.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9elements.com:email,codeconstruct.com.au:dkim,codeconstruct.com.au:mid,codeconstruct.com.au:from_mime,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 776446773E0

Hi Gr=C3=A9goire,

On Fri, 2026-06-12 at 07:23 +0000, Gr=C3=A9goire Layet wrote:
> It use the existing ast2600-pwm-tach driver.
> Placed according to bus adresses ordering.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 9 +++++++++
> =C2=A01 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 189bc3bbb47c..818d486b94ac 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -102,6 +102,15 @@ ahbc: bus@1e600000 {
> =C2=A0			reg =3D <0x1e600000 0x100>;
> =C2=A0		};
> =C2=A0
> +		pwm_tach: pwm-tach-controller@1e610000 {
> +			compatible =3D "aspeed,ast2600-pwm-tach";
> +			reg =3D <0x1e610000 0x100>;
> +			clocks =3D <&syscon ASPEED_CLK_AHB>;
> +			resets =3D <&syscon ASPEED_RESET_PWM>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};
> +
> =C2=A0		fmc: spi@1e620000 {
> =C2=A0			reg =3D <0x1e620000 0xc4>, <0x20000000 0x10000000>;
> =C2=A0			#address-cells =3D <1>;

Thanks for the patch, however:

https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git/commit/?h=3Da=
speed/arm/dt&id=3D6cf976b2728f2494215c51c7339dd50b154125ce

You can also find the commit in linux-next.git master and soc.git
soc/dt, queued for v7.2.

Andrew

