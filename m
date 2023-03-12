Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB06A6B63E6
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Mar 2023 10:04:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZDPP2p1rz3cDT
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Mar 2023 20:04:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C3cg//7X;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=klaus.kudielka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C3cg//7X;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZDPF4VZfz3bdV
	for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Mar 2023 20:04:16 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso5984163wmp.4
        for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Mar 2023 01:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678611853;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pc80kOGlqxH4dxS+XiPVwGBzRY6XRSb/pMTBjXDBKDE=;
        b=C3cg//7XD2AcK5g+5oCgxoHKpG4SvHhXCR6v3qVBpiEF+WUBvq8ZZ5tLZALnAauFJj
         rEjcj8NQdRwYA4ux+JtDErrDB5Nzgzw/AjFO7u0h0p6bfBrcaoPow6njYj1Dpibayb5/
         rgQXZOJX2QpGVTOFfuhNc4VViO3V+jQGWDutKXSO3z29+LOIX7NHJe8BgWUeV0Qk+DSk
         mMlP6cSn2QTc59qxxyX991VOGeYMydMOolYIb9WD2htJwDY+uEmUa0Eg8folOgr2R58c
         RDylORvHuf3pHLcGdHNCl4UQ7gXNtsoP/5FQmSl+eZlfQ7tij9W7fxrqeMU92uRl/3o4
         YRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678611853;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pc80kOGlqxH4dxS+XiPVwGBzRY6XRSb/pMTBjXDBKDE=;
        b=j5YheBQCfwPuOUzax9cGB7SJhEbHHswhsKTOOqhGp5giPX3ZMoX4AjbKETNJNo4GRQ
         vSlsUk55QHVmn1Yk83rcAW9gbdqBOAKzqvu/h9Ghf9kpfi/ngQa+aYhmye03L7Na/REZ
         6EwJfuJk00y3rIsjTELogKHflMnyxuXw5r2YTOt65WlutxhXXzO0Y9bFlj/3yaH9vcn/
         cyZq8ajVbZGh8xAwbYmHnkyqrKeSaJ6IF4rhSmM5oYpn1ObwJrXg2iV5roCNdrYHySp3
         67SkRxSdPH6gjYDUJRrsicN9TM7f5Y+Xz3cwQP5WF+kWq4JMSmgc6Xla0H4Xc5CFF6IA
         gJ5w==
X-Gm-Message-State: AO0yUKUds2Rg0WBiyJYOZK2rul14lu8C7wGh978vv9J+JRnG+1J3Py19
	S6vW9XmWbhkrAJs1LAPEnMc=
X-Google-Smtp-Source: AK7set+ky1MP5G4zegthCZnFjMiOBM5971of0IvZsyf8jSOYuUK5Q1+66wGmT3hiJ3eY3UnFWhYJRw==
X-Received: by 2002:a05:600c:1d02:b0:3e9:c2f4:8ad4 with SMTP id l2-20020a05600c1d0200b003e9c2f48ad4mr7065700wms.8.1678611853347;
        Sun, 12 Mar 2023 01:04:13 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:b020:289a:731d:fbb8? ([2a02:168:6806:0:b020:289a:731d:fbb8])
        by smtp.gmail.com with ESMTPSA id p23-20020a1c7417000000b003e11f280b8bsm5233062wmc.44.2023.03.12.01.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 01:04:12 -0800 (PST)
Message-ID: <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sun, 12 Mar 2023 10:04:11 +0100
In-Reply-To: <29ee3cc4-a1d6-4a07-8d90-4b2f26059e7d@lunn.ch>
References: <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
	 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
	 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
	 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
	 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
	 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
	 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
	 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
	 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
	 <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
	 <29ee3cc4-a1d6-4a07-8d90-4b2f26059e7d@lunn.ch>
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

On Sun, 2023-03-12 at 03:53 +0100, Andrew Lunn wrote:
> >=20
> > What you are proposing here would not show any improvement on the
> > Omnia, as only the 6 ports would be scanned - right?=20
>=20
> Correct. But their also should not of been any noticeable slow down,
> because there should not be any additional scanning when everything is
> described in DT. And the move of the MDIO bus registration from probe
> to setup should actually make it faster than before.
>=20

But then, why *do* I see such a big difference on the Omnia?

mdiobus_scan_bus_c45() takes:
~2.7 seconds without phy_mask patch
~0.2 seconds with phy_mask patch

(It's not a big deal, but somehow strange)

Regards, Klaus


PS: There was another open question: How long does the first
unsuccessful mv88e6xxx_probe() take, when calling
mv88e6xxx_mdios_register() from mv88e6xxx_setup()?

I would say "negligible":

[    0.194414] mv88e6085 f1072004.mdio-mii:10: *** mv88e6xxx_probe call ***
[    0.194739] mv88e6085 f1072004.mdio-mii:10: switch 0x1760 detected: Marv=
ell 88E6176, revision 1
[    0.208163] mv88e6085 f1072004.mdio-mii:10: *** mv88e6xxx_probe return -=
517 ***

