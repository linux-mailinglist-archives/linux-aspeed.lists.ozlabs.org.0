Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D798369BF11
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 08:48:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKHjZ5S5Qz3bhY
	for <lists+linux-aspeed@lfdr.de>; Sun, 19 Feb 2023 18:48:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=rB70gVJY;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kemnade.info (client-ip=2a01:238:4321:8900:456f:ecd6:43e:202c; helo=mail.andi.de1.cc; envelope-from=andreas@kemnade.info; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=rB70gVJY;
	dkim-atps=neutral
X-Greylist: delayed 1851 seconds by postgrey-1.36 at boromir; Sat, 18 Feb 2023 04:02:52 AEDT
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJJ644G52z3bgd
	for <linux-aspeed@lists.ozlabs.org>; Sat, 18 Feb 2023 04:02:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fdyKvwYgQMyYOvs0tXMattzjV5AJbXrXbx9GVNi92gc=; b=rB70gVJYdKjUfB2yk/iVq2XOG1
	Kgz5TPxBW/7arPV6XSZz1yZ12auLu2TXIoaD7K1FW7uVqa7Wsyapj81K0uh4ETQJe0YucyxwXfZpy
	JAWsOqemDPnYuCoYmLLtqw4gPH5njmPZcee71RnsRhqjJqZk5RvQeRKNKHrtD7lssDjdYV5n1amOe
	eKJ4MgDUEax7LfqUoDPNYve/gQX9vV9j0+WlUmBSa9sdoJQdCjuzI1JKc36+uMNZ3/Ue/j/mXAhwL
	UCjZUecALDmF/lsNq1WZWU3DfsBUsTMeVWxjcMsU5G8HWJEn2M+viihT0izK/FZKldRpU0JBFzo8l
	N5Mx9YRg==;
Received: from p200300ccff0dfd001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0d:fd00:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1pT3de-00064j-S3; Fri, 17 Feb 2023 17:31:11 +0100
Date: Fri, 17 Feb 2023 17:31:08 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 15/17] gpio: omap: Convert to immutable irq_chip
Message-ID: <20230217173108.1448ce92@aktux>
In-Reply-To: <Y+8xkV5aUrAajLNP@atomide.com>
References: <20230215-immutable-chips-v1-0-51a8f224a5d0@linaro.org>
	<20230215-immutable-chips-v1-15-51a8f224a5d0@linaro.org>
	<Y+8xkV5aUrAajLNP@atomide.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Sun, 19 Feb 2023 18:42:49 +1100
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
Cc: linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, Daniel Palmer <daniel@thingy.jp>, Alban Bedel <albeu@free.fr>, Kevin Hilman <khilman@kernel.org>, Marc Zyngier <maz@kernel.org>, William Breathitt Gray <william.gray@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Jay Fang <f.fangjian@huawei.com>, linux-gpio@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Santosh Shilimkar <ssantosh@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mun Yew Tham <mun.yew.tham@intel.com>, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, Romain Perier <romain.perier@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 17 Feb 2023 09:49:37 +0200
Tony Lindgren <tony@atomide.com> wrote:

> Hi,
> 
> * Linus Walleij <linus.walleij@linaro.org> [230216 09:38]:
> > Convert the driver to immutable irq-chip with a bit of
> > intuition.
> > 
> > This driver require some special care: .irq_ack() was copied
> > from dummy_irq_chip where it was defined as noop. This only
> > makes sense if using handle_edge_irq() that will unconditionally
> > call .irq_ack() to avoid a crash, but this driver is not ever
> > using handle_edge_irq() so just avoid assigning .irq_ack().
> > 
> > A separate chip had to be created for the non-wakeup instance.  
> 
> Nice, works for me.
> 
> BTW, I still see these warnings remaining on boot:
> 
> gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> 
> Seems like we might be able to get rid of those too now or are
> there still some dependencies with /sys/class/gpio for example?
> 
on what are you testing? on -next? I thought I have fixed theese warning with
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=92bf78b33b0b463b00c6b0203b49aea845daecc8

Regards,
Andreas
