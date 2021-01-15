Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E26792F8486
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jan 2021 19:34:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHVFd28NFzDvWJ
	for <lists+linux-aspeed@lfdr.de>; Sat, 16 Jan 2021 05:34:13 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RrGrpF9V; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHSGV5ZxTzDvP7
 for <linux-aspeed@lists.ozlabs.org>; Sat, 16 Jan 2021 04:04:50 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCA0323136
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jan 2021 17:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610730286;
 bh=xL1qD5UoYvaR5sDbbTcXcMlF4EKf3ytys8k0AGtC3gQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RrGrpF9VWDTLLz4gzV3wdPTf0r639f0y7YibTCLm3xNa4qy+ot3HScEl2gWb9/VqD
 5ThGMdKi2IOi5fJax1I6bKVZZ7bW9Gotcev+SzDjyp18NLChwtKw496uzSWurCe6VG
 0viA48S2xhvM4YdoynTAccoqQbCKJubvaFOUVX5b2deC0KWiDP8pieEU8Eb1dc8XBa
 gp0fXZMye+LsBqWJ1tUHOh2wAzHYt7XROU9OBAt9zcg5XvbLyTt2f6up4htdxCEr0F
 +qUeG6ahaU4TGeGQqLaJmJG2/HniEWxaMDFNluuSkr1J870OTLJVECJJG0+W/ADff2
 71YX1U/44pNiw==
Received: by mail-oi1-f170.google.com with SMTP id 9so10246823oiq.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jan 2021 09:04:46 -0800 (PST)
X-Gm-Message-State: AOAM53398QTCPlVrXcBJPAGrde5BFw8BslLUAyBFnNkmIxAtEGEOP9c+
 pI6NUlx2tFSZUYyOzXvxxpDAzelee8rw+JKcga4=
X-Google-Smtp-Source: ABdhPJwYUpojCjyKnFk7rRkBhBCc0DRcNyE3acaPhQVPUZgFeNG0pjekefnQlcnjU8SupuAE6DMolmVHu/eMeFOPQSs=
X-Received: by 2002:aca:e103:: with SMTP id y3mr6018950oig.11.1610730286232;
 Fri, 15 Jan 2021 09:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
 <HK0PR06MB33807C054FCE9E355346E204F2D00@HK0PR06MB3380.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB33807C054FCE9E355346E204F2D00@HK0PR06MB3380.apcprd06.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jan 2021 18:04:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2WPvWokkqJB-yhfQH1ofofGNvibqPjUXPme+F2LCHjxw@mail.gmail.com>
Message-ID: <CAK8P3a2WPvWokkqJB-yhfQH1ofofGNvibqPjUXPme+F2LCHjxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC
 SNOOP driver
To: Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Robert Lippert <rlippert@google.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Venture <venture@google.com>,
 "xuxiaohan@bytedance.com" <xuxiaohan@bytedance.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jan 6, 2021 at 10:57 AM Ryan Chen <ryan_chen@aspeedtech.com> wrote:
>
> Hello John, Joel, Jae,
>         For this should be set LCLK to be CRITICAL it will fix LPC related driver. (KCS/BT/SNOOP)
>         I have send the patch before.
>         https://patchwork.ozlabs.org/project/linux-aspeed/patch/20200928070108.14040-2-ryan_chen@aspeedtech.com/
>
> Hello Joel,
>         Will you consider this patch?
>         Beside KCS/BT/SNOOP, UART1/UART2 will be most related issue for host side.

Sorry it did not make it into the merge window. The patch is still in
patchwork. I could just pick it up directly for v5.12, or wait for a
combined pull request with other work. Joel, please let me know
what you prefer.

        Arnd
