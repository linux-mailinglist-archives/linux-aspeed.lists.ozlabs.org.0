Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E15614BC60
	for <lists+linux-aspeed@lfdr.de>; Wed, 19 Jun 2019 17:06:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TSvc1dpQzDqsW
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Jun 2019 01:06:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="yEAuqHd/"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TSvL6SG3zDqsC
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jun 2019 01:06:06 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id i21so3628387ljj.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Jun 2019 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CLJF5UoD0PkktcnwFEog1D4I3y+sELYQ4QMuolgvp6s=;
 b=yEAuqHd/teD0bEa7Wvv7EtSMZmX8mb6QsDEE3Aerx0LAnx2E4q6Gw+E4oHeMkrbx4X
 L+xDstCW0A1lRuwgSgfSXAYw+P8g9iFRxygf80S2I3D385MHj3PSi2CAKckN85Rcml/M
 GibXtG1D5ovltPNE9NE9LU3HTHrveAE9Y2fReaVv2Gb9J4bLzc9RbfZnHJrhUjp8Gu4z
 j0P7DZ1TPe0OjdPmch+r7FGd7w0u69YMAmiqJ9fpNqsS3DWd8X9mG8TlP+DXaTKcVDhI
 aNbhxe/mhawugb1K+RNV+ZFx1xApKMhMXwOVZIL8ylN8hNFDdEHyThk8HvrWIzdbfzbZ
 xFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CLJF5UoD0PkktcnwFEog1D4I3y+sELYQ4QMuolgvp6s=;
 b=L43hNWyFvWYcTnb8qydZ7wt+SDH1ek87JEa6bDQx/xfIz0CsGoPeji9yPm5gXQjS8D
 Rh6tRs2z1cJzzx7jSM2SapKZSrNnPIwXajxsnIVWxDQtBhUwGv9r4bSMHMyxo2rSxI+z
 vkTN6QKVvzTF8VbKSKuYCclCgKVxsXc/pMCbKO0nhEinIMEivY2OPq3TYAmlKqjBL5UH
 fKR6uddwCHTNxcSdeLgtQgmG09NgxOjlOJ7xp6H3/nrCSLyOJv/7Rvk1BKzTf9G3Orh2
 zP60iDdgtpeyTc10CyK5bPhYzlEQKDn3GPW8tWHUq6/3AHX0049Qw/4r1kMgaaSlnZl1
 MOyg==
X-Gm-Message-State: APjAAAXW2kx6TzTEPA83k808Li1NbHm2glOGjlkxTk7qKmFReibmIT/f
 Lb+LBtcpPbmIgJPoCDp7Jw1QnQ==
X-Google-Smtp-Source: APXvYqyMLO96BhAhlytIE+Ka8kFdXOnwnlt/Y3Ev1WHd9s/vwbPB0/i4dHhJQ2MiOCAxa7GBxsCb+A==
X-Received: by 2002:a2e:9155:: with SMTP id q21mr35693704ljg.198.1560956763090; 
 Wed, 19 Jun 2019 08:06:03 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id t12sm3132540ljj.26.2019.06.19.08.06.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 08:06:01 -0700 (PDT)
Date: Wed, 19 Jun 2019 07:12:30 -0700
From: Olof Johansson <olof@lixom.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] ARM: configs: Remove useless UEVENT_HELPER_PATH
Message-ID: <20190619141230.rtgeunr23gybv7u2@localhost>
References: <20190604185229.7393-1-krzk@kernel.org>
 <CAJKOXPd4LVFGgonbsuxii-5Fu5wWhxU9yotLHw+OXsPcxYw_3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPd4LVFGgonbsuxii-5Fu5wWhxU9yotLHw+OXsPcxYw_3g@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2019 at 04:53:53PM +0200, Krzysztof Kozlowski wrote:
> On Tue, 4 Jun 2019 at 20:52, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Remove the CONFIG_UEVENT_HELPER_PATH because:
> > 1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
> >    CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
> >    made default to 'n',
> > 2. It is not recommended (help message: "This should not be used today
> >    [...] creates a high system load") and was kept only for ancient
> >    userland,
> > 3. Certain userland specifically requests it to be disabled (systemd
> >    README: "Legacy hotplug slows down the system and confuses udev").
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > For vexpress:
> > Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> >
> > ---
> >
> > Changes since v2:
> > 1. Remove unrelated files.
> > 2. Add Geert's ack.
> >
> > Changes sice v3:
> > 1. Change also mini2440_defconfig.
> > 2. Add more acks.
> 
> Hi Arnd and Olof,
> 
> Do you want to apply it directly or maybe I can send it along with
> other my defconfig pull request?

Oh, just saw v3, since it didn't thread with v2.

Applied already with the equivalent fixups, so we're good.

-Olof
