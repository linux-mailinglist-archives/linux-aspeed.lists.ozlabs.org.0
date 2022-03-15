Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD24D923B
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Mar 2022 02:21:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHbGW0TXdz30KV
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Mar 2022 12:21:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yHIrZlxo;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yHIrZlxo; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHbGN5Twwz3085
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Mar 2022 12:21:30 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id w16so34326395ybi.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Mar 2022 18:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ACQBTbiJyudTuHLv2P7/SRrqHrvj49C/1S4/j95gw9Y=;
 b=yHIrZlxonQRoX8uaFietSxxyEhLRBDVLG+J0g+eRDJoLgbBAO/rlYgyf58UGQxIWhN
 JKRKTgpFScPu1ApC6aqZqs/qT3Pu4Niy+vUUVZBLQzJb9qVFhX5ZFTbdlQO2KeoIOP1m
 Li90CxtlVH6WtfMqNPjFPeMU7vgvZAv6UQqEm1aYMxb16sOP/FHFd0GuhEkbGCrqPgwX
 j8YRPk6cbpSZooquF5gIvlISBTYEU6UmH8pGWWOJtAjHw7Eeq2R6usUOD7gTnd0prB57
 F46FBO+LWFqYYQ9vf/qIVtASdqO2Gj9oZPZmh4D1/sVasaeoMF3pmN89d0GH8tjJ8goy
 E+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ACQBTbiJyudTuHLv2P7/SRrqHrvj49C/1S4/j95gw9Y=;
 b=rD4DXMoxFfm4/fK7bQMqX+X4g3VxzMx0nLHb2zcTvmQOuXy57nhd5SZDrewDCe85Xs
 yqbefV7gww9vJtouNYCoDxzZi7dtjNZYGu5j/0Al8HpFkm9TdWHGvZienZL/AL4xacJq
 WVM0EWgwBBIGb/rkiDr1qsAp2vU+DLgjOYreV1BlQIk7liX8rnn68XS8Zyb9pVeE+x65
 VuQxOyGdC2xIpImJ7xAl3h+sXKkIrF+zB0weU8Qw5rw2k2ji6RG302+kwhLIONyqbj2G
 XIDLAHolQq+BP18qdQji5uirmiJuSkIRDfQ9uyAjm8M/+u+RwUU69gpigdvxWb/KgrL4
 pG4Q==
X-Gm-Message-State: AOAM532NMfCj5r86kmErnwOD1viVr4rnliwb8ay9pehR4eGe6kENZsLF
 gwXlKGfBobzXrL1MC/xO4bqS1HUeQ7xkUk8ojhT/sg==
X-Google-Smtp-Source: ABdhPJx99c5U8udn983xmnwpOxBzvhzCMlxyP3HiN2d4p2Paf/encCvO/7WsowIdPYmJkzjxqH4ytz4twNe+Ml9NHBI=
X-Received: by 2002:a25:2308:0:b0:628:9a66:7327 with SMTP id
 j8-20020a252308000000b006289a667327mr20426355ybj.626.1647307286726; Mon, 14
 Mar 2022 18:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-2-joel@jms.id.au>
In-Reply-To: <20220304000311.970267-2-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Mar 2022 02:21:15 +0100
Message-ID: <CACRpkda3q=Rh7Kmi8Cycg4CAYUhzpRxLf+ErwxR_0drtTNTr+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: aspeed: Update gfx node in
 example
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Mar 4, 2022 at 1:03 AM Joel Stanley <joel@jms.id.au> wrote:

> The example needs updating to match the to be added yaml bindings for
> the gfx node.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I guess you will merge this elsewhere or shall I apply it to the pinctrl tree?

Yours,
Linus Walleij
