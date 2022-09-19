Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB76E5ED2F8
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Sep 2022 04:22:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McgHB4hj8z3bd5
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Sep 2022 12:21:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=pT3AVw/X;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lixom.net (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=pT3AVw/X;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWg5m3BYHz2xbC
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Sep 2022 08:56:26 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id kr11so2064950ejc.8
        for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Sep 2022 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5S9VBftUHA8Ab+AfT1DhnDF/jWnQCvfphMhw9w+YVhc=;
        b=pT3AVw/XaQKfMJa28M67X6CWfwalI0Uvo6unsRjOTD2Z+d/hMLJagRy91+fB9mWt/H
         RvjlLsn+3FsNx74QkbruJHKtTQ+30w35PYmoN36zBZvRhmzaaut2t/ejO0VHEYQ77EDj
         OXDYFEqkBBbGSPaGws21i+7eNFUtsVpC10Ocfp53V0C+AqpxtnC2gWLf09NvoZb8DNZe
         nefkWz5Q2xpTnqPE/9sJZpmszdShkKibcjHKjjaL4N2+oQKOJucjE0sZV5m8l2gxJQLL
         eUTG5Bs9Z5UoBJW4L2zlLkhjGsOc0HVn5guvp/vsJvOqjFnEQJHDOGaHy7aMupntX7WF
         7vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5S9VBftUHA8Ab+AfT1DhnDF/jWnQCvfphMhw9w+YVhc=;
        b=fDp8cUvrOadtdbc8fR14HBm8cfKySReQwhpPEMPdXHbV7t/48s2MjGJK9rDodG/cmp
         mPAs8Js5IpSGJH9fnG7AoT2JfM9w6YBg3fCjbcjWawD8Zka1Gxas9i9Pcol/MponNpzZ
         CEAcvhJVX+0FktmlkJGy+KWLOcWK4R4JUgstIo+gtMAQp7Nf7Ci7NGOLUFg1pii6wacf
         NSGDD6s/yT2E4D368m0nSOXDhCvOYy6bOFOaH9H8cSGEjbGqHaBy+6xtx5VDzu5eKc06
         xkkfdl+cuQxTeu/12B4sk7EzsieFYiMEI23D7TL6zI1RAg0PcELAaRu9NQiXMGcwqamH
         k0qg==
X-Gm-Message-State: ACrzQf1adLxMddNgL9KHjVhwCiXWsIRbsH210AUOUNEjxjxCeSV4f7pn
	znR+CaIY3BDjB4IdAj489w3a/Szjo7QGxs8NWCMIfw==
X-Google-Smtp-Source: AMsMyM5kdxcAfNB78ChbidtnpNAMschNYMIGpvHRr7zgKTZ4CCEGx6bhJgHHTNr9SAgKH+LAmfDCBtvH2R9hQBackB8=
X-Received: by 2002:a17:906:ef8c:b0:77c:8f77:330 with SMTP id
 ze12-20020a170906ef8c00b0077c8f770330mr14503775ejb.604.1663628181793; Mon, 19
 Sep 2022 15:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com>
 <YwS5J3effuHQJRZ5@kroah.com> <CAOesGMivJ5Q-jdeGKw32yhjmNiYctHjpEAnoMMRghYqWD2m2tw@mail.gmail.com>
 <YygsEtxKz8dsEstc@kroah.com>
In-Reply-To: <YygsEtxKz8dsEstc@kroah.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 19 Sep 2022 15:56:09 -0700
Message-ID: <CAOesGMh5GHCONTQ9M1Ro7zW-hkL_1F7Xt=xRV0vYSfPY=7LYkQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix console probe delay when stdout-path isn't set
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 28 Sep 2022 12:20:27 +1000
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
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@xilinx.com>, Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.b
 eznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, sascha hauer <sha@pengutronix.de>, Saravana Kannan <saravanak@google.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Tobias Klauser <tklauser@distanz.ch>, linux-mips@vger.kernel.org, kernel-team@android.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andreas Farber <afaerber@suse.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>, heiner kallweit <hkallweit1@gmail.com>, ulf hansson <ulf.hansson@linaro.org>,
  Neil Armstrong <narmstrong@baylibre.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>, kevin hilman <khilman@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Orson Zhai <orsonzhai@gmail.com>, paolo abeni <pabeni@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org, Timur Tabi <timur@kernel.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>, iommu@lists.linux-foundation.org, Laxman Dewangan <ldewangan@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Baruch 
 Siach <baruch@tkos.co.il>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, joerg roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org, jakub kicinski <kuba@kernel.org>, will deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, netdev@vger.kernel.org, david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito
  <orito.takao@socionext.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 19, 2022 at 1:44 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Sep 18, 2022 at 08:44:27PM -0700, Olof Johansson wrote:
> > On Tue, Aug 23, 2022 at 8:37 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> > > > These patches are on top of driver-core-next.
> > > >
> > > > Even if stdout-path isn't set in DT, this patch should take console
> > > > probe times back to how they were before the deferred_probe_timeout
> > > > clean up series[1].
> > >
> > > Now dropped from my queue due to lack of a response to other reviewer's
> > > questions.
> >
> > What happened to this patch? I have a 10 second timeout on console
> > probe on my SiFive Unmatched, and I don't see this flag being set for
> > the serial driver. In fact, I don't see it anywhere in-tree. I can't
> > seem to locate another patchset from Saravana around this though, so
> > I'm not sure where to look for a missing piece for the sifive serial
> > driver.
> >
> > This is the second boot time regression (this one not fatal, unlike
> > the Layerscape PCIe one) from the fw_devlink patchset.
> >
> > Greg, can you revert the whole set for 6.0, please? It's obviously
> > nowhere near tested enough to go in and I expect we'll see a bunch of
> > -stable fixups due to this if we let it remain in.
>
> What exactly is "the whole set"?  I have the default option fix queued
> up and will send that to Linus later this week (am traveling back from
> Plumbers still), but have not heard any problems about any other issues
> at all other than your report.

I stand corrected in this case, the issue on the Hifive Unmatched was
a regression due to a PWM clock change -- I just sent a patch for that
(serial driver fix).

So it seems like as long as the fw_devlink.strict=1 patch is reverted,
things are back to a working state here.

I still struggle with how the fw_devlink patchset is expected to work
though, since DT is expected to describe the hardware configuration,
and it has no knowledge of whether there are drivers that will be
bound to any referenced supplier devnodes. It's not going to work well
to assume that they will always be bound, and to add 10 second
timeouts for those cases isn't a good solution. Seems like the number
of special cases will keep adding up.

The whole design feels like it's falling short, and it's been patched
here and there to deal with the shortcomings, instead of revisiting
the full solution. (The patches are the console one, and another to
deal with nfsroot boots).

As long as it doesn't keep regressing others, I suppose the work to
redesign it can happen in-tree, but it's not usually how we try to do
it for new functionality. Especially since it's still being iterated
on (with active patch sets posted around -rc1 for improvements).

Oh, and one more thing for the future -- the main patch that changes
behavior due to dependency tracking is 2f8c3ae8288e, named "driver
core: Add wait_for_init_devices_probe helper function". It's easy to
overlook this when looking at a list of patches since it's said to
just introduce a helper.


-Olof
