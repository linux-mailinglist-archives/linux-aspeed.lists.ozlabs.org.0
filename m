Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 106F4262876
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Sep 2020 09:22:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmYPv0kNPzDqT6
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Sep 2020 17:22:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MskrfZnZ; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmYPm2VlwzDqJX
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Sep 2020 17:22:35 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id o8so2018530ejb.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Sep 2020 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rO8zY4SOk/PyIA4prlUmHLVh2+ctXvivZUrMTHOdfHA=;
 b=MskrfZnZsX7Iuf32LZyCZNzbIGXaeW+mK14mUDqYgOSribmqAZDvmz6KL5ttLjqipX
 0HopvRMl/pbef4OquOPAaByTp17ipnjqwMBRTDF5vqky3Dq5MqT4nfy6qxe8qVvr8lQw
 NkfivOti0pWe4NwtLb/25Q40m9Yhaj4s3RJIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rO8zY4SOk/PyIA4prlUmHLVh2+ctXvivZUrMTHOdfHA=;
 b=DRAlYSGSQLPhROrVBe3E+XAM/LqaHXRVSDjb3o94ns0Cwil6KtJKBNCQ9xYk6JV7A/
 2H7V26ePBOFYqy853D18NWZwtZeDAESNbpZNpLXEDK23XmIOJhHN8YdjiQxpk5LT71yH
 XIotFv0SAaCbB/ZYsKRBJWJVV2XwpQl3MOwMi2u+/VPUvnEsjuXZqRL7oCr//fTZKSxT
 inupbtk997kdfRYXANVDY3dKsLPPb+kYFWvC8XtRFRghZl+uREgVMGxOMTu14peP2xER
 IylhdG0xhcAZQVB8NCPrd6DhJR7kF1lCrYna8VbntHNPuTAqWL9maUIVBsHd8EOPHVvt
 uXcg==
X-Gm-Message-State: AOAM530fQKQYKETtjVQs+bUpCMSXfiA/sk+YU80k7FXta6FdBOeiWwtq
 PcAjthM3vc5Iqg8KqdzDdCjGYcmsw1f+tuiBY70=
X-Google-Smtp-Source: ABdhPJzG8i0Ylu6Upc12ayDxcIwkT9Rb3MGN1wQb3dn2PS0s9yBulo2UK0UfKwHfUno3cr8owVw38kBJQrVRgFCbzL0=
X-Received: by 2002:a17:906:4c58:: with SMTP id
 d24mr2472778ejw.108.1599636151097; 
 Wed, 09 Sep 2020 00:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200812112400.2406734-1-joel@jms.id.au>
 <1e56af7945b93a22e31ba6d81da82cbdb1b237b6.camel@ozlabs.org>
In-Reply-To: <1e56af7945b93a22e31ba6d81da82cbdb1b237b6.camel@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Sep 2020 07:22:19 +0000
Message-ID: <CACPK8XfZ6hLv0Ls0g=b5wdr6A3ei3nzVKDgyOt5Su_Y8g8yQ7A@mail.gmail.com>
Subject: Re: [PATCH] ARM: aspeed: g5: Do not set sirq polarity
To: Jeremy Kerr <jk@ozlabs.org>
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
Cc: stable@vger.kernel.org, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Oskar Senft <osk@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 27 Aug 2020 at 06:27, Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Joel,
>
> > A feature was added to the aspeed vuart driver to configure the vuart
> > interrupt (sirq) polarity according to the LPC/eSPI strapping register.
> >
> > Systems that depend on a active low behaviour (sirq_polarity set to 0)
> > such as OpenPower boxes also use LPC, so this relationship does not
> > hold.
> >
> > The property was added for a Tyan S7106 system which is not supported
> > in the kernel tree. Should this or other systems wish to use this
> > feature of the driver they should add it to the machine specific device
> > tree.
> >
> > Fixes: c791fc76bc72 ("arm: dts: aspeed: Add vuart aspeed,sirq-polarity-sense...")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> LGTM. I've tested this on the s2600st, which is strapped for eSPI. All
> good there too, as expected.
>
> Tested-by: Jeremy Kerr <jk@ozlabs.org>
>
> and/or:
>
> Reviewed-by: Jeremy Kerr <jk@ozlabs.org>

Thanks Jeremy. I have queued this for 5.10 and applied it to the openbmc tree.

We should also remove the code from the aspeed-vuart driver, as it is
not correct. Better would be a property that is set according to the
system's hardware design.

Cheers,

Joel
