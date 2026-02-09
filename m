Return-Path: <linux-aspeed+bounces-3502-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEW3L9J9iWks+AQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3502-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 07:25:22 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C63D010C047
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Feb 2026 07:25:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8ZSG2Rq9z2yFm;
	Mon, 09 Feb 2026 17:25:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770618318;
	cv=none; b=eJ2FpFForOiQEs00hNhVMg604cf2lvxmD+kuzvfharMHwzljrleGW5UQP4LiK7ufIg28UCXKMtQAIJbSgMjCcNOBHzvy349r2dlC2Puv+xAHdjHAcHuUw+ULf1ZTkhgErVecwc9sVcECG1fbgTRiP7RHn4AoitNieN7tH+hc5W//Q1CqP4sI3SIsdKGW9fSWXDJdNYjioRiKXToHSGK8gciI2qq9FZdd5OgJ3rRBk/oiWdeC7Fe1xbj3S6TVGW1SoIy8MQoZXmV2i/ksKXVv2dUvMh9i37P6lz25CKG4rinvswyyoPAjcmUkJ7xNqrPkMT8kqhI8koCHOWs4IOVetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770618318; c=relaxed/relaxed;
	bh=ar3F1SrcFnyPVG6bOtSIkfRJ2etxte/LoL65GWVjh94=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DJxL94tdQm9YZ2n5/Do9RZFdb9Feragtrl1bqb8yVR08MIV9xhEEMKmpMO2cVLSnLdS3FBZO9WDtWTJ+1aKG8ZdwMvckXASX6YdskQ43WdowAgoRIe7CVgktkWZ6AYM3nzvnFg9QM5xnyXjiA+Lx8iUBy/1ojwDQB4eXG2fxlzywMML3i7TQeGan1pTt0bEoT7ImEzPPebch76OlNPGROhVya88DdLna1lWOgJcWUBzQ5h2/Tg2azot2l1eRiTZKyO1CWXR/PENS57Y7DFA66DbfPfrFiQ3CUEruavb4HbaQjtnX1BGDVpwJUWsSu19oySr9WuIgkiDAMVy9q9nTpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MXWof2kq; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=MXWof2kq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8ZSF69Wcz2xHX
	for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Feb 2026 17:25:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770618317;
	bh=ar3F1SrcFnyPVG6bOtSIkfRJ2etxte/LoL65GWVjh94=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MXWof2kqJdIPkCMc8mZqPulb9S9JC1cV/ocb9l1kp9btkGnEmlD+Nz3gC1ndKB2Cq
	 M2+I/vK2aHNX4mob/8BnKf6AC+joemHdoj8HHO5AKLxfK5VLU2EJIG/r3dSABGfz5/
	 LtvmOuHZeyFrRh963yLUjfbQpVqGqRzot0Ef5UsFAH8mPzNjd2HKspBuL0i/G9N8W6
	 jZjdFGwZU+WQUR/TC2+yjOIwAoMkhWOTTuDNr5q6bMMk6EFZyKSiKUTHWvsxnuvmSg
	 QTrCp50w3hLEf2C84BhnAtrbG84RmY0QREFLKW2OHnP85SDSh9aKikYHTKTfrMEZAj
	 qymy2AyvFNOXQ==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B3A84602DE;
	Mon,  9 Feb 2026 14:25:16 +0800 (AWST)
Message-ID: <963194a5e7e88ae8ae1fe367d34d2fcdc329d814.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 4/7] ARM: dts: aspeed: yosemite5: Add ipmb node for
 OCP debug card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Jackson
 Liu	 <Jackson.Liu@quantatw.com>
Date: Mon, 09 Feb 2026 16:55:16 +1030
In-Reply-To: <20260130-yv5_revise_dts-v4-4-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
	 <20260130-yv5_revise_dts-v4-4-4d924455f3a7@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3502-lists,linux-aspeed=lfdr.de];
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
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim,0.0.0.10:email]
X-Rspamd-Queue-Id: C63D010C047
X-Rspamd-Action: no action

On Fri, 2026-01-30 at 16:20 +0800, Kevin Tung wrote:
> Add the device tree node to enable the IPMB interface used by

Here in the patch description you use (capitalised) "IPMB" but in the
patch subject you've used (uncapitalised) "ipmb". Can you please be
consistent and use capitalisation for acronyms.

I wouldn't normally mind and would just fix it up, but I've other
feedback on this series and have fixed the same problem a few patches
already today, so it's a growing source of irritation :)

Andrew

> the OCP debug card.
>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 7 ++++=
+++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> index 983aebc394d9159c7e3db2e7c39e963f7b64c855..84d3731b17f7c7c87338672bb=
cc859de2b89b722 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -365,7 +365,14 @@ i2c6mux0ch3: i2c@3 {
> =C2=A0
> =C2=A0/* SCM CPLD I2C */
> =C2=A0&i2c7 {
> +	multi-master;
> =C2=A0	status =3D "okay";
> +
> +	ipmb@10 {
> +		compatible =3D "ipmb-dev";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> =C2=A0};
> =C2=A0
> =C2=A0&i2c8 {

