Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0681E1210
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Oct 2019 08:25:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ygNP24mnzDqJM
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Oct 2019 17:25:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="AuCfw9OI"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ygLx4k2LzDqR1
 for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Oct 2019 17:24:09 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id a194so14691104qkg.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Oct 2019 23:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yi1p/5AgQUValFkbegnxonQlGe9ds008uEI8GJ+OXbo=;
 b=AuCfw9OIu+7nH6ya75fRfE9wSSXOEJme4h+b4Jl8lqE3QhpBP0wyip4SbHdD89k+dU
 YXkDowI6+oNJdoRgFSF8ON+KH+nGnv9PS7lTmPjLzsl0n3+c81FqncBaSpb91bkTBQeu
 W7CouiNjm3HxMmcdVYt1E1lY3fcVggMLerrJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yi1p/5AgQUValFkbegnxonQlGe9ds008uEI8GJ+OXbo=;
 b=HQgdKEg0kCTdD2SuWGmlFhzOr/Q1DmChp3frFKuZ+8GIi39BvIOUTt7RphUN4IKHTI
 0v7bgNSj6Nvi+3CuTyuyqwtVKqDQ3dPJvgeXHCoPlskN1Hx3pDG1zRUkYetne4bI5pWK
 5dMywzQPZumAyZ7G7TwP1N16wVAH+rYtNi1eejPTMJtKsRBxdMUYrGE6P5AccTRMTihJ
 wXEWhj3w99HINhPtWzFhnSr6NgtIFFFMbT5iNuyfx33FrnpQo3e8i830W5q8zgyG7M79
 C2urFg9QDVYpxOibz+ZOS22+CrrfUkLgOQZGz5mX7fGc5MprR4fdKylgPmdwTB7fySDv
 A4Ng==
X-Gm-Message-State: APjAAAVlMF8SB8IJlqoVgn2q78/Mobi8XQlGGdRxxPHykvQySjZd2u6w
 LavwtT5AGPDYa7IBuxA66daa5CddQFdiW/NBNgU=
X-Google-Smtp-Source: APXvYqzVR5Etz/Es4HiMMf1UU0Ef58kwEksY2/0I7PJeRjGUW1kKtmEKe5E3i1zok0d9FQ5uFZGtdYzcPByiBOb1fvE=
X-Received: by 2002:a37:aa07:: with SMTP id t7mr7032088qke.414.1571811845300; 
 Tue, 22 Oct 2019 23:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <baabb9e9-a1b2-3a04-9fb6-aa632de5f722@web.de>
In-Reply-To: <baabb9e9-a1b2-3a04-9fb6-aa632de5f722@web.de>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Oct 2019 06:23:53 +0000
Message-ID: <CACPK8XfUJ5VGpTS3gwxSVZbdWZKPH6PwT2JKGGJ2yzoXYKdtZg@mail.gmail.com>
Subject: Re: [PATCH] EDAC: Aspeed: Use devm_platform_ioremap_resource() in
 aspeed_probe()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: Tony Luck <tony.luck@intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@marvell.com>,
 James Morse <james.morse@arm.com>, Stefan Schaeckeler <sschaeck@cisco.com>,
 Borislav Petkov <bp@alien8.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, 21 Sep 2019 at 16:47, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Sep 2019 18:32:46 +0200
>
> Simplify this function implementation by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Joel Stanley <joel@jms.id.au>
