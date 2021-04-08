Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7156E359039
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 01:13:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGcWQ2nq1z2xxt
	for <lists+linux-aspeed@lfdr.de>; Fri,  9 Apr 2021 09:13:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=YgqR7cly;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=YgqR7cly; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGRwp3tWpz309y
 for <linux-aspeed@lists.ozlabs.org>; Fri,  9 Apr 2021 02:46:17 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id c3so2868759qkc.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 08 Apr 2021 09:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P9Dutpry47e9G1LsI+esYplVO+0VII6tEqAJFfWkRFs=;
 b=YgqR7clyk2k4fwdMNax1iDXb2sF/XnKNGxf0wo1TO8GFWHr9fn3olwvZRTnhLiG401
 Mg74Akp1RiWZym/qucXFCGV+PA7tE9GSB1FxRXUa12JWocy5RCT3AKfLOF0rPbKAp8zK
 QDz77Rezb71XzcRKjk67GImEAzjs/v2nKZ80axmwHu/PYnVK5lGGWeP6MQm0qGM8cjbc
 CePlxVevLaG+j2FEa/lmwKvJRXnHCFMMOtqfpLtAmxzzonEYQ4xP8e4P3F42nXwP39SP
 QBVuP3x8MHGGhx7X6YmAx60QXV9mNcADixygvhUrdhGe5SJSv9lS4wXFKSFMCma9xIw7
 TuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P9Dutpry47e9G1LsI+esYplVO+0VII6tEqAJFfWkRFs=;
 b=UYZU2+D7vZBeTjCIjLFqe5zLlsuDtsYbzLRwZb6/en50bzVqD2hvkKXsgLLxJeg3hg
 CBk1hp8iWsSg3eWMh1m1r2KdDBHH/00PthzZDVz6sjJ4PVyCFvRhm8fY78maMDMkpzCv
 DfI7fER0KacSTq/zUFDcbOsvv7OPfkN+M7Q43yVrlKSTpavcOhRJEco8BqbSsYAAp6Yf
 jRF+NDtzxwYRnCSHpTa8dwiRI+qJN0VxJRxyeT2MhIf16gZHO5i6RCbqglWn2mawybSa
 DZdWHTk/f+G1nUlI+Npic/aB1/CPn6ig7uWICmfzm328niZLQt6pNZ7uEAyjo/DIN2tc
 G72Q==
X-Gm-Message-State: AOAM532M0wAUQibc0hBt5cPRE6gS6EXMqaaoIEB59yd4edqixNZj2UYb
 qxhdhKW0+lSQXJWdIOsRbpYvVg==
X-Google-Smtp-Source: ABdhPJzbDYutSfn+FmJJZIAbAHyE8DAfowirb1kwOsQfAUvjL2fOsMnXGxO5fiM2OyXlWuyJctyzMw==
X-Received: by 2002:a37:6c01:: with SMTP id h1mr9726497qkc.182.1617900373391; 
 Thu, 08 Apr 2021 09:46:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id p5sm21412244qkj.35.2021.04.08.09.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 09:46:12 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lUXnI-002nMT-BD; Thu, 08 Apr 2021 13:46:12 -0300
Date: Thu, 8 Apr 2021 13:46:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Joel Stanley <joel@jms.id.au>,
 David Airlie <airlied@linux.ie>, Andrew Jeffery <andrew@aj.id.au>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Mike Rapoport <rppt@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Peter Collingbourne <pcc@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] drivers/gpu/drm: don't select DMA_CMA or CMA from
 aspeed or etnaviv
Message-ID: <20210408164612.GD227011@ziepe.ca>
References: <20210408092011.52763-1-david@redhat.com>
 <20210408092011.52763-3-david@redhat.com>
 <CAK8P3a09LdJ-87ZrN28y=t8Sa0zL-3NOvEWhkStMY+2EbO7UAw@mail.gmail.com>
 <YG7rKfJkTDJorqvY@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG7rKfJkTDJorqvY@phenom.ffwll.local>
X-Mailman-Approved-At: Fri, 09 Apr 2021 09:12:53 +1000
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 08, 2021 at 01:38:17PM +0200, Daniel Vetter wrote:

> If you want to change this, we need automatic conflict resolution like apt
> and other package managers have, with suggestions how to fix the config if
> you want to enable a driver, but some of its requirements are missing. The
> current approach of hiding driver symbols complete if any of their
> dependencies are off is really not great.

+1 to this.. 

Though Kconfig is basically already unusuable unless you have hours to
carefully craft the kconfig you need to get out.

I'm not sure trying to optimize this by abusing the existing language
rules is such a good idea.

I gave a very half hearted go at a simple heuristic solution solve for
kconfig a while ago. It is good enough to sometimes automate a kconfig
task, but it is not so nice.

I use it to do things like "turn on all RDMA drivers" which is quite
a hard to do by hand.

It looks liked heursitics need a lot of fine tuning as the
conditionals are complex enough that it is hard to guess which branch
is going to yield a success.

Jason
