Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F454CB1FE
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Mar 2022 23:12:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K87dl0Wvbz3c18
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 09:12:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O9Pc4FRh;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=O9Pc4FRh; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7QPL6L2pz30hR
 for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Mar 2022 05:14:12 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id p8so15005553pfh.8
 for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Mar 2022 10:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N36sF4HUer+rUuc5VxWx2NxZT2Mje9G1bKhkVtQFmow=;
 b=O9Pc4FRhQaHO8JwtvKmEa7P/p93QhIWPziYnJxBP3SmXkKfXwbS/+UXcAcizlZe2qE
 5++D1AzgFSiNA6GVcHz58RghXwcZj0T+stAg2S8I6BdGwjnEpqEP1SHJlTJIwhdk7I/A
 Km+JuAoSqO/aabb7J1BxN3aslickTdbOZI2Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N36sF4HUer+rUuc5VxWx2NxZT2Mje9G1bKhkVtQFmow=;
 b=2uUB1C3CFk6ZGVrFOvgucL6jibJywiVu2AHw9qYqQuK+ALrEay/kfp3HslcLYogumO
 /fOef3o5qAA/gCaYR08KolAgJCzDtp82o/7dLiM+08FRPle3Oi3DXtUMDD8HsXyWkLHW
 MT/Om1FYoTPxI8JA6vPUI5cUqhd5uxGn0e5WVp2AN3gDIxi9FKew5qXHxrxhX6tBCTg7
 rDV8OZ6/04tWkrBhsJNNLOiJ8InL4UL5KLZopvB50Cg2ytBKT77ycwvviPGBVLGmckcC
 FxshER2H11lGn8NT/mQZUmUqawRWrRGYsH649FplDcN90X9rALiDsWRseyYh/MEA2rMp
 HwMw==
X-Gm-Message-State: AOAM533pc0U4CaQ9M/unenKbM1w8V0K78JXsqzfLhUhvURniMxzwLjSd
 1Tk/1FM4CrV0JpDis724qtk8+g==
X-Google-Smtp-Source: ABdhPJwl/oZl7jTR8Xbiy0diMdVywUoBtjuUV8iCsVjT5dJdX8x+nPRIiFjmEv3Xm0s1V2wXWPjOfA==
X-Received: by 2002:a62:d156:0:b0:4cd:fd21:e406 with SMTP id
 t22-20020a62d156000000b004cdfd21e406mr28741951pfl.44.1646158448831; 
 Tue, 01 Mar 2022 10:14:08 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 nn10-20020a17090b38ca00b001bc3a60b324sm2540095pjb.46.2022.03.01.10.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:14:08 -0800 (PST)
Date: Tue, 1 Mar 2022 10:14:07 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <202203011008.AA0B5A2D@keescook>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
 <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
 <Yh1aMm3hFe/j9ZbI@casper.infradead.org>
 <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 03 Mar 2022 09:11:13 +1100
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Matthew Wilcox <willy@infradead.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Bos, H.J." <h.j.bos@vu.nl>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Feb 28, 2022 at 04:45:11PM -0800, Linus Torvalds wrote:
> Really. The "-Wshadow doesn't work on the kernel" is not some new
> issue, because you have to do completely insane things to the source
> code to enable it.

The first big glitch with -Wshadow was with shadowed global variables.
GCC 4.8 fixed that, but it still yells about shadowed functions. What
_almost_ works is -Wshadow=local. At first glace, all the warnings
look solvable, but then one will eventually discover __wait_event()
and associated macros that mix when and how deeply it intentionally
shadows variables. :)

Another way to try to catch misused shadow variables is
-Wunused-but-set-varible, but it, too, has tons of false positives.

I tried to capture some of the rationale and research here:
https://github.com/KSPP/linux/issues/152

-- 
Kees Cook
