Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A4AE85C
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 19:08:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tB1j7491zDqQ5
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Apr 2019 03:08:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="VzjORjCk"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tB1P2XkDzDqKt
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Apr 2019 03:07:53 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id z26so10097566ljj.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 10:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YSLhg6H0pIEIznYaFCuCBFHKdnVnFqNAMh0GNwbgISg=;
 b=VzjORjCkFdiOobLGhdofobwnJ15ToGzFh9dFZvdQ4QwpBDdTE1iId7YQz6Uztw+I0Z
 GEF6vpRo/XG5ojOBt140eqiNpkBOvAdQDpixwjr8gNsPiLPGwhVPyeht7Rxaoft/NUDa
 s6VJuurV1Vv+XzC1yHvn6qKvwDInf9Bxqq3DFONMbjwMGqsktEVYXDT5uJZz2nbFym9K
 8YNgl8RsSh5FTeuSYAhlGHTEl9JVy+ELa1+CZ9RMdoyTkoIXxgTlMZ/PZoP8Xla7fOHB
 yqM/fzjogPhkqwOv5StmAbM83STsahSang58POSx/yo1ACOkSBppN1Q+T6IcFgxdAYZw
 DGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YSLhg6H0pIEIznYaFCuCBFHKdnVnFqNAMh0GNwbgISg=;
 b=CCBXLJRM0Pqb0HW7MJZOge2MKqYwjZiIkbHAY+FZ3EQ+Zj1oYKZKuAj973PnorpLed
 xXM6uwpLwMvu6nbJxOvEXoUXiOVTeXIJBxj2ihNSh6BCiCrNEeD8Lj7Co8Jk9Z+cNCS8
 os4uWmjWoj8Dvq1QRKJqeeXhPNdYZfVmf46fjl/eh9wpEheuPF8RVyvrt+2yPU/nuaN/
 S0dmFzN6sPJD7Qm2mnrTsgex5VCPozPSTv0+nREszv5Z8RK6F38Pm3JfCqAiTN8xXwre
 S9ij1QYNBqjVPIo4N4HMsfZ4gKVZDlP+Ynh9Jeb0seSeiqP/CiuUcMz3h+sLlQGXN5RK
 ptGw==
X-Gm-Message-State: APjAAAVi5gOIbFtbPFKKcfrzLka7vrDryP6zexoB+MB1PSHpdCbRCP+w
 cQ11n6FOxkCHaiAngv5VAr3Fxw==
X-Google-Smtp-Source: APXvYqwz+hUSp4DCRK/NDPBJZOTC/yf3/ReP6EtOqz2/J10Dvgdq6oalN6ho+rY9/xkTRNx/cutsQg==
X-Received: by 2002:a2e:984d:: with SMTP id e13mr11491219ljj.61.1556557670390; 
 Mon, 29 Apr 2019 10:07:50 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id d25sm3497098lja.91.2019.04.29.10.07.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 10:07:48 -0700 (PDT)
Date: Mon, 29 Apr 2019 09:36:10 -0700
From: Olof Johansson <olof@lixom.net>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH v2] soc: add aspeed folder and misc drivers
Message-ID: <20190429163610.vhnv7z6myco7e4i5@localhost>
References: <20190422175419.189895-1-venture@google.com>
 <CAO=notxpGXLBPwsHAJdt8CwQMdNcCE=EeFymgxez_goaqnGoHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notxpGXLBPwsHAJdt8CwQMdNcCE=EeFymgxez_goaqnGoHQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 22, 2019 at 12:24:28PM -0700, Patrick Venture wrote:
> On Mon, Apr 22, 2019 at 10:54 AM Patrick Venture <venture@google.com> wrote:
> >
> > Create a SoC folder for the ASPEED parts and place the misc drivers
> > currently present into this folder.  These drivers are not generic part
> > drivers, but rather only apply to the ASPEED SoCs.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> > v2:
> >  Added configuration option for ASPEED to soc/Makefile
> > ---
> >  drivers/misc/Kconfig                          | 16 ----------------
> >  drivers/misc/Makefile                         |  2 --
> >  drivers/soc/Kconfig                           |  1 +
> >  drivers/soc/Makefile                          |  1 +
> >  drivers/soc/aspeed/Kconfig                    | 19 +++++++++++++++++++
> >  drivers/soc/aspeed/Makefile                   |  2 ++
> >  .../{misc => soc/aspeed}/aspeed-lpc-ctrl.c    |  0
> >  .../{misc => soc/aspeed}/aspeed-lpc-snoop.c   |  0
> >  8 files changed, 23 insertions(+), 18 deletions(-)
> >  create mode 100644 drivers/soc/aspeed/Kconfig
> >  create mode 100644 drivers/soc/aspeed/Makefile
> >  rename drivers/{misc => soc/aspeed}/aspeed-lpc-ctrl.c (100%)
> >  rename drivers/{misc => soc/aspeed}/aspeed-lpc-snoop.c (100%)
> >
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index 42ab8ec92a04..b80cb6af0cb4 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -496,22 +496,6 @@ config VEXPRESS_SYSCFG
> >           bus. System Configuration interface is one of the possible means
> >           of generating transactions on this bus.
> >
> > -config ASPEED_LPC_CTRL
> > -       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> > -       tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
> > -       ---help---
> > -         Control Aspeed ast2400/2500 HOST LPC to BMC mappings through
> > -         ioctl()s, the driver also provides a read/write interface to a BMC ram
> > -         region where the host LPC read/write region can be buffered.
> > -
> > -config ASPEED_LPC_SNOOP
> > -       tristate "Aspeed ast2500 HOST LPC snoop support"
> > -       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> > -       help
> > -         Provides a driver to control the LPC snoop interface which
> > -         allows the BMC to listen on and save the data written by
> > -         the host to an arbitrary LPC I/O port.
> > -
> >  config PCI_ENDPOINT_TEST
> >         depends on PCI
> >         select CRC32
> > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > index d5b7d3404dc7..b9affcdaa3d6 100644
> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> > @@ -54,8 +54,6 @@ obj-$(CONFIG_GENWQE)          += genwqe/
> >  obj-$(CONFIG_ECHO)             += echo/
> >  obj-$(CONFIG_VEXPRESS_SYSCFG)  += vexpress-syscfg.o
> >  obj-$(CONFIG_CXL_BASE)         += cxl/
> > -obj-$(CONFIG_ASPEED_LPC_CTRL)  += aspeed-lpc-ctrl.o
> > -obj-$(CONFIG_ASPEED_LPC_SNOOP) += aspeed-lpc-snoop.o
> >  obj-$(CONFIG_PCI_ENDPOINT_TEST)        += pci_endpoint_test.o
> >  obj-$(CONFIG_OCXL)             += ocxl/
> >  obj-y                          += cardreader/
> > diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> > index c07b4a85253f..b750a88547c7 100644
> > --- a/drivers/soc/Kconfig
> > +++ b/drivers/soc/Kconfig
> > @@ -2,6 +2,7 @@ menu "SOC (System On Chip) specific Drivers"
> >
> >  source "drivers/soc/actions/Kconfig"
> >  source "drivers/soc/amlogic/Kconfig"
> > +source "drivers/soc/aspeed/Kconfig"
> >  source "drivers/soc/atmel/Kconfig"
> >  source "drivers/soc/bcm/Kconfig"
> >  source "drivers/soc/fsl/Kconfig"
> > diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> > index 90b686e586c6..814128fe479f 100644
> > --- a/drivers/soc/Makefile
> > +++ b/drivers/soc/Makefile
> > @@ -4,6 +4,7 @@
> >  #
> >
> >  obj-$(CONFIG_ARCH_ACTIONS)     += actions/
> > +obj-$(CONFIG_ARCH_ASPEED)      += aspeed/
> >  obj-$(CONFIG_ARCH_AT91)                += atmel/
> >  obj-y                          += bcm/
> >  obj-$(CONFIG_ARCH_DOVE)                += dove/
> > diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> > new file mode 100644
> > index 000000000000..457282cd1da5
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/Kconfig
> > @@ -0,0 +1,19 @@
> > +menu "Aspeed SoC drivers"
> > +
> > +config ASPEED_LPC_CTRL
> > +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> > +       tristate "Aspeed ast2400/2500 HOST LPC to BMC bridge control"
> > +       ---help---
> > +         Control Aspeed ast2400/2500 HOST LPC to BMC mappings through
> > +         ioctl()s, the driver also provides a read/write interface to a BMC ram
> > +         region where the host LPC read/write region can be buffered.
> > +
> > +config ASPEED_LPC_SNOOP
> > +       tristate "Aspeed ast2500 HOST LPC snoop support"
> > +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> > +       help
> > +         Provides a driver to control the LPC snoop interface which
> > +         allows the BMC to listen on and save the data written by
> > +         the host to an arbitrary LPC I/O port.
> > +
> > +
> > diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> > new file mode 100644
> > index 000000000000..cfaa9adc67b5
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/Makefile
> > @@ -0,0 +1,2 @@
> > +obj-$(CONFIG_ASPEED_LPC_CTRL)  += aspeed-lpc-ctrl.o
> > +obj-$(CONFIG_ASPEED_LPC_SNOOP) += aspeed-lpc-snoop.o
> > diff --git a/drivers/misc/aspeed-lpc-ctrl.c b/drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > similarity index 100%
> > rename from drivers/misc/aspeed-lpc-ctrl.c
> > rename to drivers/soc/aspeed/aspeed-lpc-ctrl.c
> > diff --git a/drivers/misc/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > similarity index 100%
> > rename from drivers/misc/aspeed-lpc-snoop.c
> > rename to drivers/soc/aspeed/aspeed-lpc-snoop.c
> > --
> > 2.21.0.593.g511ec345e18-goog
> >
> 
> Fixed CC on this reply (Gmail button didn't behave as expected) and
> replied to the v2 patchset instead of accidentally the first.

Replaced v1 patch with this one. Please thread your patch series or follow up
saying they've been superceded to avoid maintainers from doing duplicate work.

> Given this patchset, I have several patches that move the drivers into
> the folder, and thought about writing it up as a series.  I wanted to
> see how this patchset would do before I staged the rest -- my question
> is, should this patchset create the folder with the empty Kconfig and
> Makefile, and then have follow-on patches that provide content to
> split out the process into multiple logical steps?

What's the purpose of moving the drivers? Are they mislocated where they are
now?

It'd be useful to see an inventory of which ones they are. As mentioned on the
other reply, there's no reason to move drivers to drivers/soc just because they
happen to be an IP block on one SoC. We really prefer to have the drivers
located in the subsystems they belong.



-Olof
