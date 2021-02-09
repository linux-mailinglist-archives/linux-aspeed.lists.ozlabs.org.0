Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF8315A00
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 00:27:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZzZd1clxzDsmC
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Feb 2021 10:27:37 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UYgVK3im; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZzZX1YfgzDsMm
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Feb 2021 10:27:31 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2696964DED
 for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Feb 2021 23:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612913249;
 bh=3vU0Uy3HSkxGGNDAunWUhBn2Lv70jpf5UWvjN+nChAE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UYgVK3imMkUdJR47b4zXfpcL3Wt0HXa/W++x7hCggRMb+o2eoIJfenAtuBcBsxjkP
 TK6EUsRAbTq/HDfLB66mEAE6IP4RT4C9EDkjGQGIVgUBIwkEUdzaBh3HadjIn8LvGp
 9DOWU/5qM3oMneZYr16z0y8jyAR9nMmVAWB03VcSajNcSqjnUrnKKeP40eddKso8pz
 5UTWnXaDOnNNNUtcmdJ5s5KPUrMK2O7FS7332vaUKpJV2xxcYzzBMSMf6JwKISTAe9
 N3ba3L+lukmKeRJ5aT218Mx0tww7bJqcFfEAZwQaDW9on3y8jC/dJ1wZVznf0yus4a
 rqxbPI4hGXujw==
Received: by mail-ot1-f44.google.com with SMTP id c16so162153otp.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Feb 2021 15:27:29 -0800 (PST)
X-Gm-Message-State: AOAM532Sw7Ygnt26GfuJIZUqn0xV+H44mTYLk6jZwJExfn/q7VhHXjuX
 GR+UpsMf5V3e7amEJOFbwOI3l5Mh7Bo/eNgysfs=
X-Google-Smtp-Source: ABdhPJwjgBTaSG9EOqxnTvcLwfqEElK3d/DzjLqI0xBj4lU6eEGJ52F5b0KPivFKoiRhdtMvl9c1LkFhNkmzSkqFtdA=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr39086otb.305.1612913248471;
 Tue, 09 Feb 2021 15:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
 <HK0PR06MB33807C054FCE9E355346E204F2D00@HK0PR06MB3380.apcprd06.prod.outlook.com>
 <CAK8P3a2WPvWokkqJB-yhfQH1ofofGNvibqPjUXPme+F2LCHjxw@mail.gmail.com>
 <HK0PR06MB3380A1F79CDE49FACC1A3E71F2A60@HK0PR06MB3380.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB3380A1F79CDE49FACC1A3E71F2A60@HK0PR06MB3380.apcprd06.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 10 Feb 2021 00:27:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1g8szrHnhOxjwFkwYt+P5ukawZRr7jbwtJLVyFVHS21g@mail.gmail.com>
Message-ID: <CAK8P3a1g8szrHnhOxjwFkwYt+P5ukawZRr7jbwtJLVyFVHS21g@mail.gmail.com>
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
 <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrewrj@au1.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Venture <venture@google.com>, Joel Stanley <joel@linux.ibm.com>,
 "xuxiaohan@bytedance.com" <xuxiaohan@bytedance.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Jan 16, 2021 at 2:03 AM Ryan Chen <ryan_chen@aspeedtech.com> wrote:
> >
> > Sorry it did not make it into the merge window. The patch is still in patchwork.
> > I could just pick it up directly for v5.12, or wait for a combined pull request
> > with other work.
>
> Hello Arnd,
> Thanks your update.
>
> >Joel, please let me know what you prefer.
> >
> Hello Joel,
> Could you help check on this patch?
> https://patchwork.ozlabs.org/project/linux-aspeed/patch/20200928070108.14040-2-ryan_chen@aspeedtech.com/

Hi Joel,

I see there has been no new pull request for mach-aspeed in
v5.12. If you have any material at all, please send it as soon
as you can so I can pick it up this time.

As a reminder, the patch here has still not been merged, as I
never heard back from you.

       Arnd
