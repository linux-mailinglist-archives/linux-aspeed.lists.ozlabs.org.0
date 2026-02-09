Return-Path: <linux-aspeed+bounces-3503-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIirLGp+iWlO+AQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3503-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 07:27:54 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A147E10C068
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 07:27:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8ZWB6PhWz2yFm;
	Mon, 09 Feb 2026 17:27:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770618470;
	cv=none; b=W9QwscNQSWp2m41yZf3YiamUwnC3TLPXKQpy3SK8jF8jh/JEpMDqgiS1UYdpXNVxpdAl6ratOXcZBtL9VviZxpr59LdNLdY7wLuB60Xzfc5ORrww8N6dsxtQA5emKvel10ykq5TnUOpkQDurRpwHtyttTGPvsXdWlRoTnRrtEYIG9VrNbDjzaHOTzWfcBkdKLttqVcVRS2UNmoHShITW0oBkJ/48OL1ctUNfgM4ugFGm5U20EyId4QDF4kxBVRhfMEQGU/cu9W5s3X1OxTbpMBpMj6DANHIXlwlwDIaZSr9atvBOSME2qNDW9jR2P3wLFeEoPCwFD8G9HVeRBgqHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770618470; c=relaxed/relaxed;
	bh=lDQataT0zQ8ngyYFf1MHoLkS47NJ64fQnpqo9H3fIYk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S9RuIG+sE5evRvuh38/TZ7jwCctpZdnoMjk7QfUqK9VocYhXIh6bYfPB+rSA9oHSOUVMtDiZ3AariNDuHzv9TKR879EwM4HxT31oCiPDcBxCmYREq21Ml/CPvIo78vcrTMxqF/PRGM3YLxtDPnRBbtPsm3dxJiWPetPVCzBm/OCR05z4PyMWu3ExoPAl9Ch7SJ5fXkNwYs0tcUj1uBp0vB/j8AjVhSHQWIJJTI7XodMkomW10hs3T8lqlYXSvgF6urbui4Rk+JYlNOIkWgtXwq1kGvoiD9LyASzq5g5vp3hgKZegJiUteSqLXKqmpcaFkg0yTj7qVckQmdYLKYqv4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fM/Zcuj+; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fM/Zcuj+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8ZWB1zv8z2xHX
	for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Feb 2026 17:27:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770618469;
	bh=lDQataT0zQ8ngyYFf1MHoLkS47NJ64fQnpqo9H3fIYk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fM/Zcuj+qwUA9e1/tofsoaYdw/mrlVHhUU9ExrbwGMMHBzvE3x9Nm97uWlO8gwXZC
	 6YLxpqX2XTpOxsQMXGx5CXLeKy8ShBpJn9uum3BD/IzuSUqEF6K+bUC8fVJeS53zbu
	 r49N9s6XT4AbFUFuE78LYRhDBAlSnOzgySEW8+HtjMWOhBU6hduVoPfe8EYS4r5WLu
	 zv0nrRnjaYWMLGCf0uYzbmMzBjb9VqAgoCBgatc8eLmtDfSHMZQpjLohQLU8GMIFHC
	 M9lgHxnalARjf0qA442GGXDU2kdC6ZKlOMXg6MKVk42a2rNYx0oUFRI01n/jKJjCwo
	 fzw5ckvZr2Fmw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E27E5602DE;
	Mon,  9 Feb 2026 14:27:48 +0800 (AWST)
Message-ID: <62b7557d7af89742d142c1c8d317b8fa14f7ba24.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 6/7] ARM: dts: aspeed: yosemite5: Add PDB IO expander
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>
Date: Mon, 09 Feb 2026 16:57:48 +1030
In-Reply-To: <20260130-yv5_revise_dts-v4-6-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
	 <20260130-yv5_revise_dts-v4-6-4d924455f3a7@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3503-lists,linux-aspeed=lfdr.de];
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
	DBL_PROHIBIT(0.00)[0.0.0.24:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim,0.0.0.40:email,1d:email]
X-Rspamd-Queue-Id: A147E10C068
X-Rspamd-Action: no action

On Fri, 2026-01-30 at 16:20 +0800, Kevin Tung wrote:
> The new hardware design adds an IO expander on the PDB
>=20

What does "PDB" mean? Can you please expand this in the commit message?

>  to support
> fan presence detection and HSC
>=20

What does "HSC" mean? Can you please expand this in the commit message?

>  fault monitoring. So Add the PDB
> IO expander device node to the DTS.
>=20
> The IO expander interrupt is connected to SGPIO92, which was
> previously named ALERT_PADDLE2_SMB_N and not used by the system.
> This pin is now repurposed and renamed to FM_IOE_ALT_N to reflect
> its function as the PDB IO expander interrupt.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts=C2=A0=C2=A0=C2=A0 =
| 21 ++++++++++++++++++++-
> =C2=A01 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> index 524597a81365ef10cd03b67d35eeb88a965cbe0a..48f864b52d1a22b12f8a39ba9=
703a90349ed930d 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -389,6 +389,25 @@ adc@1d {
> =C2=A0		ti,mode =3D /bits/ 8 <1>;
> =C2=A0	};
> =C2=A0
> +	/* PDB IOEXP */
> +	gpio-expander@24 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x24>;
> +		interrupt-parent =3D <&sgpiom0>;
> +		interrupts =3D <92 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-line-names =3D
> +			"FM_P52V_AUX_FLT_N", "FM_P12V_AUX_PWRGD",
> +			"FM_SLOTX_HSC_FAULT_N_FF", "",
> +			"","",
> +			"","",
> +			"PRSNT_FAN0","PRSNT_FAN1",
> +			"PRSNT_FAN2","PRSNT_FAN3",
> +			"","",
> +			"","";
> +	};
> +
> =C2=A0	power-sensor@40 {
> =C2=A0		compatible =3D "ti,ina238";
> =C2=A0		reg =3D <0x40>;
> @@ -937,7 +956,7 @@ &sgpiom0 {
> =C2=A0	"ALERT_OC_PADDLE2_N","",
> =C2=A0	"ALERT_OC_PWR2_N","",
> =C2=A0	"ALERT_OC_PWR11_N","",
> -	"ALERT_PADDLE2_SMB_N","",
> +	"FM_IOE_ALT_N","",
> =C2=A0	"ALERT_PWR14_SB2_LEAK_DETECT_N","",
> =C2=A0	/*bit48-bit55*/
> =C2=A0	"ALERT_PWR14_SB3_LEAK_DETECT_N","",

