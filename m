Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD46B5917
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 07:49:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PYYSR2z6Bz3c8V
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Mar 2023 17:49:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=edANvY7i;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=klaus.kudielka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=edANvY7i;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PYYSG13rbz3c6Z
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Mar 2023 17:49:31 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id q16so6986900wrw.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Mar 2023 22:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678517365;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t9Sei6I41qwaNDpvUvee9z5C91oyEDGNKLdeZYKLxNI=;
        b=edANvY7i593vAONZaHOUC5NiTyvSEIOaEbRI65vr3O9TxYv0ucfrHbTN/3kKRE+Tkj
         kTzD5JZupdMhbGi/9AnNNPmHiuE08jI/tDmN55s78utBRjPSG+l0RbEZnCYPcGD+Tz1T
         70SRtuq64yUALwEsep5xNXJc6oI5P3t6w/o40wW1OTAPugx9zilfGYPK0knap2c0m2im
         5Z/9gQAteGMZ+0W210gckbP716ypWMyoR+YjhAkCz7XgEa42CNrLjViIRviq6sj4NPdo
         QyuS+vIB0RIRQYRmiUSeCbnb6/CwiOy5Ih0xqHu+CFxbOLzMgGWScerqv1Gusqg8th2l
         zYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678517365;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9Sei6I41qwaNDpvUvee9z5C91oyEDGNKLdeZYKLxNI=;
        b=jLrdXcRC+d+6OBow8s8pvUn5x0NV5D0OUvV0TkIGvC1ChHn+wQnUOtGJAIe6DenZMX
         erRgDEV9IyoO0tnwsdCKMG8E+ul8SD/hnyAJe5QY3PRCYIaxsUEiCMYiRId9NGfuUbBx
         dNJsnUmCOGmL3i+cPWE9aDSnrmav7WrD4+1rnbWAxeb6GNnrfLSgMIoSx2e+Mv8O64M2
         EX7LUxdHwIu2qjjQpNu9aV8sRBkmWMrnLYxYq0PcVB3VbbLjGbep9vcT2FKwFwX/WfRB
         6afIJ4FgeQ/etgIQw6gjObCIxEeC0Esk4haEjpgULXbYnBVpvzIS+MIB293TleMUEh6X
         gqQA==
X-Gm-Message-State: AO0yUKWwIJfJyUQ0KFa9+xMD85j379LTarNdMe8iWj9BVbykYfYzZB31
	vmpE2nySccrmP+p4li0l1Nk=
X-Google-Smtp-Source: AK7set/JPr6Wq2tfBtyFn0d5vMSSusNpNT1n3m5tdIocxlx8YgFkE6JLYZ5AoEW5KjyXe2yJU0ieQQ==
X-Received: by 2002:a5d:4a8c:0:b0:2c7:d7ca:4c88 with SMTP id o12-20020a5d4a8c000000b002c7d7ca4c88mr18447829wrq.55.1678517364619;
        Fri, 10 Mar 2023 22:49:24 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:c51d:786:86a8:fd19? ([2a02:168:6806:0:c51d:786:86a8:fd19])
        by smtp.gmail.com with ESMTPSA id l2-20020a5d4bc2000000b002c57475c375sm1584656wrt.110.2023.03.10.22.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 22:49:24 -0800 (PST)
Message-ID: <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Sat, 11 Mar 2023 07:49:23 +0100
In-Reply-To: <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
References: 	<20230116-net-next-remove-probe-capabilities-v2-4-15513b05e1f4@walle.cc>
	 <449bde236c08d5ab5e54abd73b645d8b29955894.camel@gmail.com>
	 <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
	 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
	 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
	 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
	 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
	 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
	 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
	 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
	 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
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

On Sat, 2023-03-11 at 00:49 +0100, Andrew Lunn wrote:
> > Yes, that helps. Primarily, because mdiobus_scan_bus_c45 now is called =
only once,
> > and at least some things are done in parallel.
>=20
> Great. Could you cook up a proper patch and submit it?

I can give it a try. The commit message will be from my perspective,
and the change Suggested-By you.

Best regards, Klaus
