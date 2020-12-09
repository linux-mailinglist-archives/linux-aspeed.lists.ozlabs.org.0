Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 420442D3B99
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Dec 2020 07:42:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrSC62jSPzDqgV
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Dec 2020 17:42:10 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KgV7/ht2; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrSBz6J1RzDqDS
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Dec 2020 17:42:03 +1100 (AEDT)
X-Gm-Message-State: AOAM531fTB1ouWfjLqHuRY1hBirqA0/aEky5q3mzli8hF7u90CVLOkI5
 19VcCoNwhkq0PqQLjduOv0pPQe9DB9+pMo6rLyo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607496119;
 bh=ES+jHxWzAcEixUmgxWWwRfBScxOikH27C+yNiQXbzAE=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=KgV7/ht2s4oo+u4hXz+67bgiYN/Mf/lHTv8Lv5/heO2hQQJ5eYY+wu7hfE0CzJfTF
 dQd2h1bUw5goMq+2GjUbNI85MV0ghm3pO+Jb5aSqZuGNuQsPVHHqZ/Q4iv+DZf3MUV
 haw7H0F0uHqbozE1u6+4sO5GaukCKMmPJVoFtkgMRDucOQI9fF0UWGXMNWbgcjobUh
 Q2cmEsc9K90cUNkWrBAnn316aFQsVI51i/sstkku3xkzUydxiHoOfgeYLe+IGS8e6W
 aq6fr47hlXNoGGewgdRlR5/NS9ngRtXkHQtkly9Z6hVlQ6Pz8cO/hcFt52/yGHVUGM
 AsWlpXn51PksA==
X-Google-Smtp-Source: ABdhPJxYLmHvoPig9koxxVNiAtFkVWeACs1tzrWPAudrWny6ydXo3iY7W4TLkUx0lOr6DV2U0gBBdnbUfasML3/M5l8=
X-Received: by 2002:aca:bd0b:: with SMTP id n11mr738232oif.11.1607496118436;
 Tue, 08 Dec 2020 22:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20201208091748.1920-1-wangzhiqiang.bj@bytedance.com>
 <CACPK8XePhJj8HzbLB4QgJQCjTuH_kPq=sWyOhdcGPmptqD6Aqw@mail.gmail.com>
In-Reply-To: <CACPK8XePhJj8HzbLB4QgJQCjTuH_kPq=sWyOhdcGPmptqD6Aqw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 07:41:41 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0jPEjXnqGpeQ=A0Pd0esX+k4EHgbrGr+NAQAx1vO9Q7w@mail.gmail.com>
Message-ID: <CAK8P3a0jPEjXnqGpeQ=A0Pd0esX+k4EHgbrGr+NAQAx1vO9Q7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] misc: Add clock control logic into Aspeed LPC
 SNOOP driver
To: Joel Stanley <joel@jms.id.au>
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
Cc: Robert Lippert <rlippert@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 open list <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>,
 Jae Hyun Yoo <jae.hyun.yoo@intel.com>, Patrick Venture <venture@google.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 xuxiaohan@bytedance.com, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Dec 9, 2020 at 3:17 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 8 Dec 2020 at 09:17, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
> >
> > From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> >
> > If LPC SNOOP driver is registered ahead of lpc-ctrl module, LPC
> > SNOOP block will be enabled without heart beating of LCLK until
> > lpc-ctrl enables the LCLK. This issue causes improper handling on
> > host interrupts when the host sends interrupt in that time frame.
> > Then kernel eventually forcibly disables the interrupt with
> > dumping stack and printing a 'nobody cared this irq' message out.
> >
> > To prevent this issue, all LPC sub-nodes should enable LCLK
> > individually so this patch adds clock control logic into the LPC
> > SNOOP driver.
> >
> > Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc
> > chardev")
> >
> > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> > Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> Arnd, can you merge this for v5.11, or would you prefer me to do a pull request?
>
> The device tree patch from this series also needs to be added.

Sure, please forward the patches to soc@kernel.org so I can
grab them from patchwork.

      Arnd
