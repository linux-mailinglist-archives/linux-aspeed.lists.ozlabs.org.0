Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2964CC60F
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 20:35:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8h5j2LRyz3c3h
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 06:35:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O8pgv7tG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O8pgv7tG; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8h5Z0jQzz3bZf
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 06:34:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E268661B40
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 19:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A51AC004E1
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 19:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646336094;
 bh=qZLIT90F4XcplM2Lo3kJ4q65/znkvPWFcOp2eDwbEIs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=O8pgv7tGknqom+09KiuHD5GRcYP/ohbBHnXPelng8Yi0MmNgyuNCc8GkwVCINEy7P
 HhDeTtYhnm98tBJYI0e7FYR4OPj1mE/7nlJDO0RLz7Z7PghGTJvJN5cYn6He6nmemH
 6SXsaoJwKkL2Ees+CBz7ah+TrQyFuJ3ecLeqwD3tbMLxst3tk2bGFYKJz7K5MBpavY
 KgKsWaVfv1UASAmeg/OGip1yhG0cdl41ogh2gYsbPqHEg6Pl5p/n7Zr0+bLdob4y0Q
 YPILwxzcPQfOtJlHG486I4nH3sZZYSZGsEWYXeVQjWFPpZvNgXtuVKjtJ7lf9BzLZB
 KGzlM4rSEqEQw==
Received: by mail-ej1-f53.google.com with SMTP id p15so12866001ejc.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Mar 2022 11:34:54 -0800 (PST)
X-Gm-Message-State: AOAM530pwhp2N3JfVjhE1Q5Xe790RNOKcFuoE12iGK+ilULIv+2eigI1
 i7GSffd9HGx7rzxAd7yw4rj85myuNJ3PAQc2Wg==
X-Google-Smtp-Source: ABdhPJx0hlwzgKGdlH4tw49VP50LJrLmoRLBkcohsBvqowt5gK8H0KLMAqPTBTvqX8a4DBd0nJg6hrqm54G1z2AvljU=
X-Received: by 2002:a17:906:181a:b0:6d0:ebf5:c064 with SMTP id
 v26-20020a170906181a00b006d0ebf5c064mr27654515eje.82.1646336092554; Thu, 03
 Mar 2022 11:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20220302051056.678367-1-joel@jms.id.au>
 <Yh+w7+CdtYYJoRkh@robh.at.kernel.org>
In-Reply-To: <Yh+w7+CdtYYJoRkh@robh.at.kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 3 Mar 2022 13:34:40 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+zDTfZaYf3H98rub8e-fSmtFFQ_ok=cQ3bqPojx0_Ckg@mail.gmail.com>
Message-ID: <CAL_Jsq+zDTfZaYf3H98rub8e-fSmtFFQ_ok=cQ3bqPojx0_Ckg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: Convert aspeed-gfx bindings to yaml
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
Cc: devicetree@vger.kernel.org, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 2, 2022 at 12:01 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 02, 2022 at 03:40:56PM +1030, Joel Stanley wrote:
> > Convert the bindings to yaml and add the ast2600 compatible string.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
> >  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
> >  2 files changed, 69 insertions(+), 41 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
>
> Applied, thanks.

Uggg, now dropped...

What's Documentation/devicetree/bindings/mfd/aspeed-gfx.txt and also
the example in Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml?
Please sort those out.

Rob
