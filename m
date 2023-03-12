Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7056B6771
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Mar 2023 16:16:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZNf902MZz3cDG
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 02:16:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gEuJTs8r;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=klaus.kudielka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gEuJTs8r;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZNf02dHKz30Kr
	for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Mar 2023 02:15:50 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so9272851wms.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Mar 2023 08:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678634143;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HKhPGEn48aizwdQtbeZiRqDsuVUTk1YIcEaDe2udzRA=;
        b=gEuJTs8rAj1FCry+rF1CeDbSIJK4LxGMUnOjarG4/VP8KKgqsJUS97hWWDm/LLbiLW
         DNQ0Lgv+r71NlgTtrHCdRkFUVfk67F+DDREcWS4aUT+4VSSOCJmJZsO8W0QkU9rwf7Pt
         Cn53G5xe1ZmguLXX7D5vjKUUiGAvx0jMMHBtIGc0xb6cQC0pyqgYzQq/5exWq7S2NgAw
         puJNDQ7cMwLtW2DmEDwPz2M617RtRbHrqK+okSwZHzrkzpQJMYdHvGJ3PJY/Qo8cR4bp
         uGPv8bwajsDGqCgW0wzlKakgzcPmmU6xg/kmQMWn5STGhVY0qNHM1t9MX50d2RvaCpBy
         MmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678634143;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKhPGEn48aizwdQtbeZiRqDsuVUTk1YIcEaDe2udzRA=;
        b=ui9knUynPCQ8QE7/nbBWSiGNVxqp3e+Vi3IxVRq5A1DGTCphPlMrjFReZmCa8cwDqo
         QcWCwj4RmFzuOTBBpADCs4+3r1P6IAUfHCrNIWxz1jLtQCMk46TTwYzZ1YQGbaBj2l+4
         TR5kaEyQbVWScA4Qhi1SuzP15Tp1fJw7CR14fRkwGQG/etLMLs2D7usDaXVWXx+IRsHq
         dHjwZyITCm91ZtfdQJqVI+SHf29Qh+85tkPlBobkqmNIpXJlTyPqKKit6iz0ns+TBUjn
         hfAGnYjFh3cxE9O1qhAVASbDsTDJyhfN2cYQlEzcFAwiBZA+7hYpZ3JhkzcJCJWV2f5h
         coIw==
X-Gm-Message-State: AO0yUKUjtuK21PHugIWEXcrrBIhjuwuL3VsIfZGTMTEdjwTppQGPFkOF
	3qpK+ZrfcwerOWQxlZ6B7mo=
X-Google-Smtp-Source: AK7set/bjPBg/zjhzM6DAttzOabIYrkqkkyVgJDWMpQSEhOR00TB9rrFvoFv2QmmclSj+Zkfo4wXvg==
X-Received: by 2002:a05:600c:46cc:b0:3ed:1f9c:aeff with SMTP id q12-20020a05600c46cc00b003ed1f9caeffmr2414620wmo.36.1678634143542;
        Sun, 12 Mar 2023 08:15:43 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:1606:cc8d:640:3d4d? ([2a02:168:6806:0:1606:cc8d:640:3d4d])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003e204fdb160sm6741547wmn.3.2023.03.12.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 08:15:42 -0700 (PDT)
Message-ID: <024b696003d8403d62c45411c813058684e0418c.camel@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sun, 12 Mar 2023 16:15:41 +0100
In-Reply-To: <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
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
	 <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
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

On Sun, 2023-03-12 at 10:04 +0100, Klaus Kudielka wrote:
> On Sun, 2023-03-12 at 03:53 +0100, Andrew Lunn wrote:
> >=20
> > Correct. But their also should not of been any noticeable slow down,
> > because there should not be any additional scanning when everything is
> > described in DT. And the move of the MDIO bus registration from probe
> > to setup should actually make it faster than before.
> >=20
>=20
> But then, why *do* I see such a big difference on the Omnia?
>=20
> mdiobus_scan_bus_c45() takes:
> ~2.7 seconds without phy_mask patch
> ~0.2 seconds with phy_mask patch

Following up myself, the answer is in the call path
mv88e6xxx_mdios_register()
	 -> mv88e6xxx_mdio_register()
		-> of_mdiobus_register()

A child node "mdio" would be needed for the scan to be limited by
the device tree. And this one is *not* in armada-385-turris-omnia.dts.

My (incorrect) understanding was, the child node "ports" would trigger
that behaviour.

Best regards, Klaus

