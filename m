Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C86B5DAD
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 17:11:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYnwf1k3Mz3cLW
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Mar 2023 03:11:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NjrXETXb;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=klaus.kudielka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NjrXETXb;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYnwS141Pz3btb
	for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Mar 2023 03:11:19 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id h14so7708539wru.4
        for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Mar 2023 08:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678551070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wTwVrHUwJuxo2nAv8WcWBTbXbikVuPU2S0IixEuBaf4=;
        b=NjrXETXbZlcsvTNNCs9yzV/6PY+CmmQAxqPMkiNPO7QnMj6ytAX2MO60sgp2paNr9c
         Hj4btjqwVQYF5lLso0uID3MzUxTkZWfLMIEk6fajBsPgnH07UIpVWC04WKT6L+qzzwUq
         2eXh/JXic2jrLs7bRYweE2xFP9A4hvZVloIFsATIbYE4tZvjdNUE217s5/7sS8Ayn3zb
         4y5cNUEUaXO/9Dhavli5sH+hB6hWTXJUzqrvs4t9pQSV8bj/6cuUmzVIvHIr6ii3bG3z
         GHvtgjEuloh0lGRfs2aBA6ScgOF2GeGe5cr4k2ApsqReCT35clKNcoVw3C+8ofih80pf
         cBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678551070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTwVrHUwJuxo2nAv8WcWBTbXbikVuPU2S0IixEuBaf4=;
        b=bDW8kLSVt8C1TAAzbgCF1W4sWUuwbwi9B5uYj7QQH2uHpbTZlJwYqIpKYYvPzxLjuK
         9wz3OTEDZaz/MYowB4rJflUCp+zLf/0sh70Qmk43wWM3NOsdPOTCCaUgCddSW+rr4X9p
         iV6k5udttPX92nE8S39iheAKnwtzdh4kMKYs9HvP6ItIb9WYS0pHcb+HmQOKR2fF07FJ
         I8yd8OOdSrw9IyloJ3NOYkf8g1lmUTx1WH29nIOGMiRzB9Ws4xcGOYFJJaHFoIJSp8nD
         Px4VN8yFmDm9YFdy1+fq9Mt1JbkNzJ6ARnBZmgNx9syrki/a6+zIpuYmOaSgcD2NxVZs
         ywkw==
X-Gm-Message-State: AO0yUKXE0WL9O4Vv72vPkmcIQ4Iod2UzOqCF7JUa5w8bdRUG0G6ImNbo
	6P9tC67UdM2SBOirBoI4bMQ=
X-Google-Smtp-Source: AK7set9VyJg+v0ZGE7y65i5aFyOLU9IOZOR0GJb9hHZKpkI2ykj3H4fHVqW+NtUo6nKqBhqI6frrGw==
X-Received: by 2002:adf:e302:0:b0:2c7:851:c0bf with SMTP id b2-20020adfe302000000b002c70851c0bfmr19781176wrj.0.1678551069607;
        Sat, 11 Mar 2023 08:11:09 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:cb1:a328:ee29:2bd6? ([2a02:168:6806:0:cb1:a328:ee29:2bd6])
        by smtp.gmail.com with ESMTPSA id b18-20020a05600010d200b002cea8f07813sm346294wrx.81.2023.03.11.08.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 08:11:09 -0800 (PST)
Message-ID: <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 11 Mar 2023 17:11:08 +0100
In-Reply-To: <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
References: <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
	 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
	 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
	 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
	 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
	 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
	 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
	 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
	 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
	 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
	 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
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
Cc: linux-aspeed@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Bryan Whitehead <bryan.whitehead@microchip.com>, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, Michael Walle <michael@walle.cc>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 2023-03-11 at 16:39 +0100, Andrew Lunn wrote:
>=20
> I have one more idea which can speed things up. The scanning of the
> MDIO bus works in two different ways depending on if there is a DT
> node, describing what should be found on the bus. For mv88e6xxx, using
> DT is optional. Some boards do, some don't.
>=20
> If there is a DT node, only the addresses listed in DT are scanned.

Here's the definition of the switch in the Turris Omnia device tree.

	/* Switch MV88E6176 at address 0x10 */
	switch@10 {
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&swint_pins>;
		compatible =3D "marvell,mv88e6085";
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		dsa,member =3D <0 0>;
		reg =3D <0x10>;

		interrupt-parent =3D <&gpio1>;
		interrupts =3D <13 IRQ_TYPE_LEVEL_LOW>;

		ports {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			ports@0 {
				reg =3D <0>;
				label =3D "lan0";
			};

			ports@1 {
				reg =3D <1>;
				label =3D "lan1";
			};

			ports@2 {
				reg =3D <2>;
				label =3D "lan2";
			};

			ports@3 {
				reg =3D <3>;
				label =3D "lan3";
			};

			ports@4 {
				reg =3D <4>;
				label =3D "lan4";
			};

			ports@5 {
				reg =3D <5>;
				label =3D "cpu";
				ethernet =3D <&eth1>;
				phy-mode =3D "rgmii-id";

				fixed-link {
					speed =3D <1000>;
					full-duplex;
				};
			};

			ports@6 {
				reg =3D <6>;
				label =3D "cpu";
				ethernet =3D <&eth0>;
				phy-mode =3D "rgmii-id";

				fixed-link {
					speed =3D <1000>;
					full-duplex;
				};
			};
		};

>=20
> If there is no DT node, by default, all 32 addresses on the bus are
> scanned. However, DSA makes another assumption. There is a one to one
> mapping between port number and PHY address on the MDIO bus. Port 0
> uses MDIO address 0. Port 7 uses MDIO address 7 etc. If you have an 8
> port switch, there is no point scanning addresses 8 to 31, they will
> never be used.
>=20
> The mdio bus structure has a member phy_mask. This is a bitmap. If bit
> N is set, address N is not scanned. So i suggest you extend
> mv88e6xxx_mdio_register() to set phy_mask based on
> mv88e6xxx_num_ports(chip).
>=20

What you are proposing here would not show any improvement on the
Omnia, as only the 6 ports would be scanned - right?=20

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Andrew

