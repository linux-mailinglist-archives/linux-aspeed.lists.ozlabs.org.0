Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BFE4E6AA3
	for <lists+linux-aspeed@lfdr.de>; Thu, 24 Mar 2022 23:27:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPfx84vJTz307C
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 09:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xsJiIbP9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2f;
 helo=mail-yb1-xb2f.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xsJiIbP9; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPfx16WKpz2xD3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 09:27:31 +1100 (AEDT)
Received: by mail-yb1-xb2f.google.com with SMTP id x20so10836141ybi.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 24 Mar 2022 15:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BuIx2EfuKCIfA6SZfk0m4A4xmn/XxCz2VsdNSnjLe6A=;
 b=xsJiIbP9s+ofFzxTice7QHI0MJEYU5dlCS54RBfUG2x7ytlH3jCMhH0UIoX6WJXXrd
 o0GggbfRlcbZST72KUa5AlCXV8HrBeeHixpeXd6kY4TZ6u22tAdJ1kW3lKMBxDJdskG0
 yBwPgNOpLmjY2C8ZdJizxMiSmJ6eKaeA2rRP8E8iIwSanfZlWykaUiwRwwjP63Zu5Ekb
 vuenltpeigXG/bTxVAVHn+Jp3QuhIqeC7Q0c9Mc1aJNnzTO+DxNqv5uJMgwJWT/q9dMF
 lk7gQA41OZzhQ3/2UlpnqF/XoP/ld9dJn6FtHWaSB7EN5C/i9v/EErCkdxCPv2atUsE2
 P7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BuIx2EfuKCIfA6SZfk0m4A4xmn/XxCz2VsdNSnjLe6A=;
 b=YE7ncDz5hwQmWSAI7Cqs5DNcbHfBzMwHVN7aI7aEeNNbsgxW6ac8h0zFMmX830i+bM
 iWsYTOdk2NZG4+jS+3z6ysWV7EbFcAfbmbM5CzAl+vFclRE+/mWup4AuwzWBH0YDAeWw
 iRKSsijGZLVFtCvtlGFjnfySl0VqPCea5ukLer2AGLV7dQBK7NGwO3ppeOFnl8/qnrQW
 orfH1AOU21TgHdO3MkijDeAdKKeNDi5CTCw0dlmLQb/TA5HLUXZhXrOuHchbYbABRoCI
 QETGn/aA5u6iJDwoYCPUBE7s3E1yeMsuD8o1VVki9G81wnoAG5FEhmCp6UogV+GKGpB8
 SLOg==
X-Gm-Message-State: AOAM530ze/e4dLrxDWA/jm7Mr3/E/bVh+0s/SCT95d8FptmqohpCwz1G
 8xN5JZ8SG6VJqVlB4yCg/0W+6TGlXd1ozqAlRzogkg==
X-Google-Smtp-Source: ABdhPJyWfCUBXAFZEkA3vRwgVeXOfZfmF91xcRYtOHQUBNNwmYHrQxFGtrci1QUJV4Ny7aBxm0uVNqOrZbc1BWGS/8w=
X-Received: by 2002:a25:ab64:0:b0:633:6d02:ebc8 with SMTP id
 u91-20020a25ab64000000b006336d02ebc8mr6907030ybi.492.1648160847410; Thu, 24
 Mar 2022 15:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-2-joel@jms.id.au>
In-Reply-To: <20220304000311.970267-2-joel@jms.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Mar 2022 23:27:16 +0100
Message-ID: <CACRpkdZodEjzm84zd-Xh6ZFsvu5eNGT_ErXHApaH3MwGB00pFw@mail.gmail.com>
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

Patch applied.

Yours,
Linus Walleij
