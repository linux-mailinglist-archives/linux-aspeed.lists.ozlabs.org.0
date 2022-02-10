Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF344B0C4C
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Feb 2022 12:26:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvZFq0qYpz3bZc
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Feb 2022 22:26:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bmP8EM8H;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=johan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bmP8EM8H; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvZFg4npLz306m
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Feb 2022 22:26:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6BE3FCE239F;
 Thu, 10 Feb 2022 11:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FBCC004E1;
 Thu, 10 Feb 2022 11:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644492387;
 bh=uGn5sWCwfvSpb9avSSWCJHzaK458xm1a3dY7suR6Wq0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bmP8EM8H7RyB9Ym3qK7Ab0iB7yxWmeZuQHOTX1sfiP/hya1Anr35ncQb2AAxMyiCR
 AwxffvC9428xp4W3x1H65MJVHavyI2k+lZGZkdiW//uY+5lBWEVlbTKXHjVBGtld66
 BGjb1rR3IP5tpyINKARQjp9TSExlzCX7Ne2si5nMpt1UkacdN4O4e+ChsOKxMCUaca
 mPbSXUTWrGUxqNLwo/kMVaWEUn4A/hdvDBHuWmq3DSW/1hlIybZjJliSnWaG6qacxV
 WtAIy2jd3v0CZJF8Pjg+h3cWTXmRe0fYVl1KhtP4Pq61JIoV6AGYdTdGkD/QXcREG8
 8nF94wXPl+K5w==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1nI7aR-0005EK-SH; Thu, 10 Feb 2022 12:26:08 +0100
Date: Thu, 10 Feb 2022 12:26:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] serial: 8259_aspeed_vuart: replace snprintf with
 sysfs_emit
Message-ID: <YgT2TyST3OA3a4WC@hovoldconsulting.com>
References: <a0f3e5d6d438710413d1909365f99ae4d2a4bacc.1644399683.git.yang.guang5@zte.com.cn>
 <CAHp75Vd-Zszg1j6aVrX_oEJdiq4m=69JqE4RvyPMqEu30RFaTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd-Zszg1j6aVrX_oEJdiq4m=69JqE4RvyPMqEu30RFaTA@mail.gmail.com>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zeal Robot <zealci@zte.com.cn>, davidcomponentone@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yang Guang <yang.guang5@zte.com.cn>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Feb 10, 2022 at 01:13:28PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 10, 2022 at 12:54 PM <davidcomponentone@gmail.com> wrote:
> >
> > From: Yang Guang <yang.guang5@zte.com.cn>
> >
> > coccinelle report:
> > ./drivers/tty/serial/8250/8250_aspeed_vuart.c:85:8-16:
> > WARNING: use scnprintf or sprintf
> > ./drivers/tty/serial/8250/8250_aspeed_vuart.c:174:8-16:
> > WARNING: use scnprintf or sprintf
> > ./drivers/tty/serial/8250/8250_aspeed_vuart.c:127:8-16:
> > WARNING: use scnprintf or sprintf
> >
> > Use sysfs_emit instead of scnprintf or sprintf makes more sense.
> 
> sysfs_emit()
> scnprintf()
> sprintf()
> 
> ...
> 
> > CC: David Yang <davidcomponentone@gmail.com>
> 
> > - Use the CC for patch sender
> 
> This is incorrect. The submitter must have (the last) SoB tag.
> Question was about authorship just to be clear.

Please fix up the subject prefix too ("8059").

Johan
