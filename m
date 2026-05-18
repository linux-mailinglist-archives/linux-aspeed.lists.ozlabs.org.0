Return-Path: <linux-aspeed+bounces-4043-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMsLJdN2Cmo61wQAu9opvQ
	(envelope-from <linux-aspeed+bounces-4043-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 04:17:55 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AECF1564F9C
	for <lists+linux-aspeed@lfdr.de>; Mon, 18 May 2026 04:17:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJhKX2GhSz2y71;
	Mon, 18 May 2026 12:17:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779070672;
	cv=none; b=MeeAsihGzJbfm0T65L5C9G13tDEA1iQ9DgEYFb5xnoc8a2CAs4M2cAAqsg4MEjOieC4efcgtsTltsv3mTquTkOaMoReAcxirKqt+WklB8siYh+iytGgZeYFdmx/3bB/5VPJteIDGOiVmrKV3nV7VjOPYylmzPHUNDCQwYzTIs4D1Mj5bHunGXhIVrVlF1k+slkOAIOsCY59kH3XjVhc50NhE6qf7mgNgiyK0CF/zyfCjMoNHItWLAu/9Cr+m+lW7eRiXS1Vgtq4/C95CmBxHbyWihe2QIuIII8NTzqQGzQ4zkAqWCzizqdG3jeEFx9WyI05YcQduZHQsRXzQ9CyQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779070672; c=relaxed/relaxed;
	bh=PiiHDF+nX4+QzwmcKPsuaf62O5ixDsbk+wGUlXGzkVQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l158ct3kJlJ83H6j3OhVF6pwbVTw1nxnD+ag7bghgcXCvgytZWEB+LlBppswaZ7Rj2GYAX4G77P4X8NtCIO1+rYp9nQqK6J7OZfHY3/vJ6aB6DPzEiQmaE1Xb9fjUokowJDqXuNtqSZiTtVad69w45HrG3MXrI2JB5Aiezho3k9y1d82dMektrhVr7pTljElFf/0Kz0W1wXy5lCWwsMsRfZ3IyACro+i6VGlAsCKejLqaKzPZt6nckyAUoLRoYdnOpIYRlsMI8JEp8sWBsyuqcE1ujpemPzqWt5hr1aHa9cvptRBNR142gmc0dFLcKHnIf3ejwgtD6lz6PCCXCU6uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ge1iBDQ6; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ge1iBDQ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gJhKW3RJjz2xWP
	for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 12:17:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779070670;
	bh=PiiHDF+nX4+QzwmcKPsuaf62O5ixDsbk+wGUlXGzkVQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ge1iBDQ6IshC+uFwYBYN09lGe9yZ80q6yvJlNL6cbZWZRF7ta/0Yd+PqmCXc6ArY/
	 lCTER7bV69sG41xzIsPJ+EJ4RSn5HwUft2rdlzgIFwVESJ/MZE2D07LZyFV41Z95BN
	 p44G2o3kx0vBTDUoMB3/m65JszEzJEQ6+CEMCPg11RlI01Q470HvoWx+ykgOmA4K3A
	 XDYsCQZ5SM2O5PBrpVP9MqipBie08SGpQq4L3Mb+9m7xjy3yW5nUzLOvWdnXt5DhPz
	 JykTCkzdKCiy6GC5VD+DyiQm/ZI9Wv+hNN9qXDGh5f6/Nuw6QR4kmdaJpCHavxrT6b
	 5kxMjD5/JC8LA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7157A6037B;
	Mon, 18 May 2026 10:17:50 +0800 (AWST)
Message-ID: <9b81b5cf24afb2fd587c62ffd808366ac2fe5cd7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, joel@jms.id.au
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 18 May 2026 11:47:50 +0930
In-Reply-To: <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
	 <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
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
X-Rspamd-Queue-Id: AECF1564F9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4043-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prasanth.padarthi10@gmail.com,m:joel@jms.id.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:prasanthpadarthi10@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,jms.id.au];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,codeconstruct.com.au:mid,codeconstruct.com.au:dkim,0.0.0.57:email,4.196.180.0:email]
X-Rspamd-Action: no action

Hi Prasanth,

On Thu, 2026-05-14 at 08:46 +0530, Prasanth Kumar Padarthi wrote:
> Add initial device tree support for the ASRock Rack B650D4U BMC.
> The B650D4U is a server motherboard utilizing the ASPEED AST2600
> SoC for management.
>=20
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts=C2=A0 | 71 +++++++++++=
++++++++
> =C2=A02 files changed, 72 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d=
4u.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index c4f064e4b..124d4f8f8 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-asrock-romed8hm3.dtb \
> =C2=A0	aspeed-bmc-asrock-spc621d8hm3.dtb \
> =C2=A0	aspeed-bmc-asrock-x570d4u.dtb \
> +	aspeed-bmc-asrock-b650d4u.dtb \
> =C2=A0	aspeed-bmc-asus-x4tf.dtb \
> =C2=A0	aspeed-bmc-bytedance-g220a.dtb \
> =C2=A0	aspeed-bmc-delta-ahe50dc.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000..130b7f3e0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model =3D "ASRock Rack B650D4U BMC";
> +	compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial4:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x40000000>;
> +	};
> +};
> +
> +/* BMC Console UART */
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +/* SPI Flash Management */
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "bmc";

Have you considered describing the flash layout here?

> +	};
> +};
> +
> +/* Dedicated Management LAN */
> +&mdio0 {
> +	status =3D "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0>;
> +	};
> +};
> +
> +&mac0 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-rxid";
> +	phy-handle =3D <&ethphy0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +/* I2C Bus for FRU/EEPROM Storage */
> +&i2c7 {
> +	status =3D "okay";
> +	eeprom@57 {
> +		compatible =3D "atmel,24c02";
> +		reg =3D <0x57>;
> +		pagesize =3D <16>;
> +	};
> +};
> +
> +/* System Watchdog */
> +&wdt1 {
> +	status =3D "okay";
> +	aspeed,reset-type =3D "soc";
> +};

My preference is that the nodes are ordered alphabetically by label
name. Can you please fix that? While it's also fine to order them e.g.
by unit address, alphabetical order is much easier for me to assess by
inspection.

Andrew

