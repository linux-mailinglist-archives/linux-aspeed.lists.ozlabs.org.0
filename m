Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D188A44245B
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 00:52:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hjqb34bV6z2y7H
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Nov 2021 10:52:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=AFVyNJZZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=AFVyNJZZ; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjqZx6CyMz2x9F
 for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Nov 2021 10:52:24 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id br39so4996678qkb.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Nov 2021 16:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9eouahAXCmBoP2fXcZKQUpZJtWrRZSQPICoQryeoVs0=;
 b=AFVyNJZZ2GFBhEFp9jbrLperb698Ftnk1xoNnGmqSgGs/cEcgQIc0XlsYnWYFEbn2i
 MHm2bG4qqyk3T+6a0Vm6nPyAzXmSIeeS/SziI5Q17Hpqzx0/PNMYYDN5D38K9COs73Xv
 Pllo859919J7Do7UjOmnglCU9QhF+XwULm7B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9eouahAXCmBoP2fXcZKQUpZJtWrRZSQPICoQryeoVs0=;
 b=q6H1ya4DMOLuoNaU81e7Ow64Cw+UPKfJCnORMkGpo69cUwyNwmadjNF8ng8QVeikEz
 VrvHjCBwklL9bMuLaX3dxF2VMKN1lGDm/+HaHIhKOOWEt3rjEw6lW6B7hC97qHres1GD
 mrbXcgzdfu8Uol7nkqC4fLBfz8Qt8lgK0w87nw6YjrJ6DiI8X8lZpIAfDmRUbwBv8g4Y
 m7M4/KK8jMnnkIEw1HKOaeSWsUjcECaP0Y+2XXx74+Tp0TQU8xcadFGZWAxgtA0ADx59
 XpBonmK2JzUOJWY4YKCNFPlYTXL4OzT8t+0xQsj9/ZMVwis6cUjYOFvYzh5gGpsE3Kx7
 2V4g==
X-Gm-Message-State: AOAM530HuZIXMwCFaUKBVt7fgUgQHcGDfTQQTwkUxANqEqRPzjPJCjCr
 7K/GRV3H3hPpTaauy0F5cub7DL+syRFe70QPUPM=
X-Google-Smtp-Source: ABdhPJzNbKv43p0Q3hZwPiVHfSlsLzJt/pcc7KTOY+bO3Jb9HdrhFpv7DvOMO5z9FoUwNbsx+XNHEDl/oePzYk1NXHo=
X-Received: by 2002:a05:620a:4588:: with SMTP id
 bp8mr18564175qkb.292.1635810741609; 
 Mon, 01 Nov 2021 16:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211101233751.49222-1-jae.hyun.yoo@intel.com>
 <20211101233751.49222-2-jae.hyun.yoo@intel.com>
 <CACPK8XcAN-SsKDS2E_Cnv=5-Rq=9sAWYyb88i2Ub-iX0WH6aZw@mail.gmail.com>
 <3b90b836-d35f-fe98-69b1-69ebcecf54ea@linux.intel.com>
In-Reply-To: <3b90b836-d35f-fe98-69b1-69ebcecf54ea@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Nov 2021 23:52:09 +0000
Message-ID: <CACPK8XcR0zR10_dPOM0atyqU3TarkWZ9N4r0B94N56_gebjJaw@mail.gmail.com>
Subject: Re: [PATCH -next 1/4] ARM: dts: aspeed: add LCLK setting into LPC IBT
 node
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Rob Herring <robh+dt@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 Cedric Le Goater <clg@kaod.org>, openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 1 Nov 2021 at 23:48, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> > Do you need to update the bindings too?
>
> Hi Joel,
>
> Right, I have to update 'aspeed,ast2400-ibt-bmc.txt'. Will add update
> in v2. Thanks a lot for your review and for reminding me. :)

Note that they've moved to Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml

You can find this commit in linux-next.
