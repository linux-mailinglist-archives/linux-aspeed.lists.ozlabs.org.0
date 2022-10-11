Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD95FBEBC
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Oct 2022 02:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnDWw0twsz3blt
	for <lists+linux-aspeed@lfdr.de>; Wed, 12 Oct 2022 11:47:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ce+BVV5v;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=warthog618@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ce+BVV5v;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmyRz1ML9z2xjr;
	Wed, 12 Oct 2022 01:13:16 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id r18so12866217pgr.12;
        Tue, 11 Oct 2022 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=czRWuspWIHlagJO4TEuyucASTDboV9sDSZyO/JWLXqc=;
        b=Ce+BVV5v8U7whmYd/FcwKuyV+liXHdnCihvE4vxDmi/zFRXHgG5BsKzJlkvJm3ymzp
         i0kk+obd9ehg5kvdXpvifSYQKkIBJbAwLGSIa8MzHAOItPx5O2ghaGpv98wheUqfKMtx
         xYK29jqCSGAVqjF4MPQoXzVWPbY3qWyTm0lvTcEBlWPddeF6YcST3WGeI8+5CF6qMkzB
         /lDnL0m98oNEh6bOyWy8Twswwetn33Cy9kGtv+34nK50zqhZaf/wZPS7BxRAs1neYTBy
         /bZWo8ysVbEXrzMM/+HfoBHs8qu8Q0eGt0b+IXToEUouhHiAP9GLUrTwNKB7EENxNPMI
         wO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czRWuspWIHlagJO4TEuyucASTDboV9sDSZyO/JWLXqc=;
        b=YZYxmlRMjRc3xzmDOV410vuOEvdT4JJ93VOf+Bg56YOLvub9iV54167QUzTQYR7bDD
         44z8W9Bkl/Xew62LbFUrRaLPanuEUZjyJf8Hr5evVwV5aMEe/ev5tEgHDLkSFS8jtetv
         EDnDdatcwdKRd8pYijtImecgH0RqwyTCthTrZyTG+9y0e/UeYrRt229gPayx2oR8D8cc
         HGDYF0J5r4poUXhn8/LrO7V8/yMHgrGjOqljl3KL1BEZYDfeE3vFOkQy6bIu5SCIeDwK
         6TN5DG39nBUKFgtIy8O61VC0JdHARD+7BqbXUR2PZVjeZ1CZI/OrDtqnFN5qqOp7iMOu
         lttw==
X-Gm-Message-State: ACrzQf1MUcWF/QSMSNknVu1cQukKcxYVXzcXyDxcNdKpVPqWEJ/HjSgX
	TfLBI8NnXWgrUmRHuVi3QSVrLzx/S3ChQg==
X-Google-Smtp-Source: AMsMyM6A7bmN99+8aFFd/V9x8yL+08obUJvhZG8B8wKWgbvIl/Bh1jOgBftu0u99farGA2SFP/OdqQ==
X-Received: by 2002:a63:8643:0:b0:462:9b02:a0c1 with SMTP id x64-20020a638643000000b004629b02a0c1mr8758435pgd.536.1665497593024;
        Tue, 11 Oct 2022 07:13:13 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id q17-20020aa79831000000b00563ce1905f4sm1492741pfl.5.2022.10.11.07.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:13:12 -0700 (PDT)
Date: Tue, 11 Oct 2022 22:13:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0V57gI75ik4ki3A@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
X-Mailman-Approved-At: Wed, 12 Oct 2022 11:47:35 +1100
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022 at 04:48:17PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 11:05:42AM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > -#include <linux/gpio.h>
> > > >  #include <linux/gpio/driver.h>
> > > > +#include <linux/gpio.h>
> > > > +#include <linux/hte.h>
> > >
> > > Ok with the hte re-order.
> > >
> > > But moving the gpio subsystem header after the gpio/driver is not
> > > alphabetical ('.' precedes '/') and it read better and made more sense
> > > to me the way it was.
> > 
> > I see, I guess this is vim sort vs shell sort. Strange, they should
> > follow the locale settings...
> 
> I have checked, the shell and vim sort gave the same result as in this patch.
> 

The original order (sans hte.h) was done by VSCode Sort Lines Ascending,
and that still returns the same result.  That matches what I would
expect to see given the content of the text.

And for me vim also gives the original order.

Just to confirm - is '.' 0x2e and '/' 0x2f in your universe?

Cheers,
Kent.



