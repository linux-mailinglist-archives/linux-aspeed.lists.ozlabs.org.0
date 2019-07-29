Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B1679A29
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 22:44:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yBW81wd6zDqRR
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 06:44:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yBVz5LXfzDqC0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2019 06:44:11 +1000 (AEST)
X-AuditID: ac1060b2-413ff70000003a7d-87-5d3f5a99b31b
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 08.6A.14973.99A5F3D5; Mon, 29 Jul 2019 16:44:09 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 29 Jul 2019 16:44:08 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Subject: [v6 2/2] gpio: aspeed: Add SGPIO driver
Date: Mon, 29 Jul 2019 16:43:46 -0400
Message-ID: <1564433026-32163-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563564291-9692-3-git-send-email-hongweiz@ami.com>
References: <1563564291-9692-3-git-send-email-hongweiz@ami.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWyRiBhgu7MKPtYg7/nZCx2Xeaw+DL3FIvF
 /CPnWC1+n//LbDHlz3Imi02Pr7FaNK8+x2xxedccNgcOj6vtu9g93t9oZfe4+PEYs8eda3vY
 PDYvqfc4P2Mho8fnTXIB7FFcNimpOZllqUX6dglcGb9ubmUr2MhdcXvrOcYGxk7OLkYODgkB
 E4kXp6y6GDk5hAR2MUkcmSPfxcgFZB9mlHjSeJ0RJMEmoCaxd/McJhBbRMBP4vqtt6wgRcwC
 jUwSP18fYAZJCAsYSPxc/JQdZCiLgKpEyxFdkDCvgINE25ubrCC2hICcxM1znWDlnEDxXz0t
 TBCL7SWe79rLBFEvKHFy5hMWEJtZQELi4IsXzBA1shK3Dj1mgpijIPG87zHLBEaBWUhaZiFp
 WcDItIpRKLEkJzcxMye93FAvMTdTLzk/dxMjJLw37WBsuWh+iJGJg/EQowQHs5II72Jx+1gh
 3pTEyqrUovz4otKc1OJDjNIcLErivCvXfIsREkhPLEnNTk0tSC2CyTJxcEo1MKqw5PhOPML+
 45zOW5bG/e6NZSeF7t9n+RXpUnLgg8oE4YOT3yxL8u6avbZT4bvOfQ3bBwy3fzZuaUm61mDz
 /O2bpa98Z65etvz3doNYzTWsVje6HzYonRANbo/4eERixrYTW+wqNhiECU/o1GnRLe28UsaS
 9Z1Ba1uKwqlkxe7rCTbH6wST7JVYijMSDbWYi4oTASmAHMldAgAA
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Hongwei Zhang <hongweiz@ami.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Linus,

Thanks for your detailed comments.

We just submitted a v6 of sgpio-aspeed.c, it includes the updates based on
your initial feedback:

1. fix a bug in aspeed_sgpio_dir_out()
2. some comments clean up.

Regards,
--Hongwei 

> From:	Linus Walleij <linus.walleij@linaro.org>
> Sent:	Sunday, July 28, 2019 7:38 PM
> To:	Hongwei Zhang
> Cc:	Andrew Jeffery; linux-gpio; Joel Stanley; linux-aspeed; Bartosz Golaszewski; linux-kernel; linux-
> arm-kernel
> Subject:	Re: [v5 2/2] gpio: aspeed: Add SGPIO driver
> 
> On Mon, Jul 22, 2019 at 10:37 PM Hongwei Zhang <hongweiz@ami.com> wrote:
> 
> > As you suspected it correctly, AST2500 utilizes all the 32 bits of the 
> > registers (data value, interrupt, etc...), such that using 8-bit bands 
> > [7:0]/[15:8]/23:16]/[31:24] of GPIO_200H for SGPIO_A/B/C/D .
> > so registering 10 gpiochip drivers separately will make code more 
> > complicated, for example gpio_200 register (data_value reg) has to be 
> > shared by 4 gpiochip instances, and the same is true for gpio204 
> > (interrupt reg), and other more registers.
> > So we would prefer to keeping current implementation.
> 
> OK this is a pretty good argument. My review assumed one 32-bit register was not shared between 
> banks but it is, I see.
> 
> The above situation can be managed by regmap, but that will just a different complexity so go with this 
> approach then.
> 
> Yours,
> Linus Walleij
