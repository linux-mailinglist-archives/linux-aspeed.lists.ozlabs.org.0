Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D26B5EDF
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 18:33:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYqkv1039z3cHG
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Mar 2023 04:33:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RX+BkKj+;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=klaus.kudielka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RX+BkKj+;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYqkj3XQ5z306Y
	for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Mar 2023 04:32:59 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id t15so7796406wrz.7
        for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Mar 2023 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678555976;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BS/U63CP8kyc4s3+ndFwYv3c/IbBKEKDtQ8znLZINo4=;
        b=RX+BkKj+x9TiMv3r/lL//tQpdeczI/eIoOk8GNW2B997wf/HecmbDllwY2uelEG6SW
         NFzKMG9Y8UUTaOLQdyxRPlkDNP1u2gbO2I6JCDlC9f8n0tVMzUtVmkPrYMQ/5gTTvIex
         B7MpIpXwFxRMt4Za9+FOvX04zp7uhkrZF+ENEt6FiCUbmO97P3IiIUFHVUKwj/V2aZEO
         ubZie3KLAa3d3xuXS3uikY5XNveSErnSmyofgMAptn+7YChpYU7HHwVPbpFGXsb5GHU8
         pN427twy0g9FmB350c4j7aDVbOSqRrNc7uvq+AaCQtSGNScLHq5tbsThpFh3D5t1SlDX
         SKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678555976;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BS/U63CP8kyc4s3+ndFwYv3c/IbBKEKDtQ8znLZINo4=;
        b=HDvUSbwERfSRqzSgFQhy8VjMFOZiWW1hPdcd7vC06iXL8sR9yV8j2jqZejbdNQR1WM
         zx04285HDaXyA8mWxiNteHRSFbTnvWg58qyXtoNeDW/loabWM8JBy8/TxiZ/D/EwAeJY
         00LLckaVqnb7Xbs3lpPnSbQp3uMneb9MasT1fzP7G0gTfkrmsbEUthNwnddbY6l3ES/T
         EZtlPkB1wrjXVrdTL6D174XFzh8R637aK2/qUPOc0HOwcExqA1acwDWBjJhKk38Ps0yb
         VaGDTi2a0uYU4xH2XOG6BCv8cM1e9ebegH7v4FZzTAp7tZm02pOPjGyuNYiBFaDSHlPE
         5l0Q==
X-Gm-Message-State: AO0yUKVXYT2JWXU5PEw4ZdljWOBfDzXxr9E8k98yDOA/LXGH4vHkW+C4
	HQUsXVKLmF6UEwNzWk700j8=
X-Google-Smtp-Source: AK7set9ukWzDo0xy6J7gbHp7jIKCnz8dTe9J/CWuuqUqxE+n+q/r8zAWdbMSQuUV7O2FnpyIFohiiA==
X-Received: by 2002:a5d:5145:0:b0:2c7:a0e:347b with SMTP id u5-20020a5d5145000000b002c70a0e347bmr19984098wrt.8.1678555976064;
        Sat, 11 Mar 2023 09:32:56 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:cb1:a328:ee29:2bd6? ([2a02:168:6806:0:cb1:a328:ee29:2bd6])
        by smtp.gmail.com with ESMTPSA id a10-20020adfe5ca000000b002cde25fba30sm3059307wrn.1.2023.03.11.09.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 09:32:55 -0800 (PST)
Message-ID: <49a9154ae4e2b3e6bc85e560368f6474f97cea88.camel@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 11 Mar 2023 18:32:54 +0100
In-Reply-To: <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
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
	 <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
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

On Sat, 2023-03-11 at 17:11 +0100, Klaus Kudielka wrote:
> On Sat, 2023-03-11 at 16:39 +0100, Andrew Lunn wrote:
>=20
> > If there is no DT node, by default, all 32 addresses on the bus are
> > scanned. However, DSA makes another assumption. There is a one to one
> > mapping between port number and PHY address on the MDIO bus. Port 0
> > uses MDIO address 0. Port 7 uses MDIO address 7 etc. If you have an 8
> > port switch, there is no point scanning addresses 8 to 31, they will
> > never be used.
> >=20
> > The mdio bus structure has a member phy_mask. This is a bitmap. If bit
> > N is set, address N is not scanned. So i suggest you extend
> > mv88e6xxx_mdio_register() to set phy_mask based on
> > mv88e6xxx_num_ports(chip).
> >=20
>=20
> What you are proposing here would not show any improvement on the
> Omnia, as only the 6 ports would be scanned - right?=20
>=20

Well, maybe I misunderstood the argument with DT completely, so I gave it a=
 try:

--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -3797,6 +3797,7 @@ static int mv88e6xxx_mdio_register(struct mv88e6xxx_c=
hip *chip,
        bus->read_c45 =3D mv88e6xxx_mdio_read_c45;
        bus->write_c45 =3D mv88e6xxx_mdio_write_c45;
        bus->parent =3D chip->dev;
+       bus->phy_mask =3D GENMASK(31, mv88e6xxx_num_ports(chip));
=20
        if (!external) {
                err =3D mv88e6xxx_g2_irq_mdio_setup(chip, bus);

>=20

Now THAT one makes a difference! With this on top, I'm back at normal boot =
time!
I hope this is what you had in mind?

Best regards, Klaus

