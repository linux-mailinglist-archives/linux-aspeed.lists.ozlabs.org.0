Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB78F51B079
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 May 2022 23:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtqcP5bHnz3bp0
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 May 2022 07:25:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZUiMw8FZ;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZUiMw8FZ; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtqcL1F4Dz2ymf
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 May 2022 07:25:21 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id h10so4586919ybc.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 May 2022 14:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T3d2fYGVCQPH3oUWunAB6fdSYnujJZ2I8+XkzxVQ4R8=;
 b=ZUiMw8FZnaeQCj4tHgZ+yh927ALKIjlzaflimJl0MTREy3wMDwFDlUqyiKh+Q0oQmI
 SulmOktwG9BAk7EUbjJV74hALMN8j/QFaOpkyOxpr+KkK2hAX0GJ6t0wnfUO2F/ZG58w
 WaxiEaxuEOvx82Ufe2v9mdjNMxQC78ish/ZyII2Ls5x881GTkMySDBdhxdL6oQy/aWoG
 unoZII6R+E4YAj9G19q9N8ia7HohjBVASfVrHPO/W0JJQaPBVUCNuuejVmS4TCTXy2vq
 fILs3pAeMXJYYbJfkUpD5n/b25B5ffXdA8ulNVYS2I+61x0aJNVMoGewhaYqbgLLKfOa
 G2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T3d2fYGVCQPH3oUWunAB6fdSYnujJZ2I8+XkzxVQ4R8=;
 b=zA9Clh2w9ES6jqMg0Wu7mbFDztRXKXr6hROkn2Tx2wIDcORBn0y2BwBmtK+LBdvo4b
 HWzdSqbpig0TzTWb6AYNnwXo/6TyQ5YC6UeC9X+WDoKTcljqIDOjc9WWFqiT/4g+tas2
 05tUlYo1DO35R9SHO6ciJkbkdXciyLspi9bqaeL8q/KImF+wkqu2JDrv+s/8pbky/XYd
 YcY1CDNKydqZk9dTZWn4nIhN8/Z5Xl/nQhDfc2lqJBOJO9GVxg0Yw6UMk9/HC9p2MVev
 l0Rn+3kN4ZFJmc1tdgINRbOFnltRyopOiWAQvaJt/qWCAUupoQT1lot6NLuLg742U8/t
 /dLg==
X-Gm-Message-State: AOAM532Xb550i3zTo7pto7QbEi1R1xZP7625fsX48DXKheZtyDURVHY4
 PvnR7tCHV3YwzXX/hg0cgusfsY8O3dGSODYTWHnrLg==
X-Google-Smtp-Source: ABdhPJzqvODOYmcQ9TZYyXXRfyQPmMMljGJNRG/LrEqbFLH0+9/ixLSThQOOvYy9Zui0cZ7P+TuQBezYxz3hocfbs3M=
X-Received: by 2002:a25:2905:0:b0:649:7a2b:ca72 with SMTP id
 p5-20020a252905000000b006497a2bca72mr13176917ybp.492.1651699516824; Wed, 04
 May 2022 14:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220422192139.2592632-1-robh@kernel.org>
In-Reply-To: <20220422192139.2592632-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 May 2022 23:25:05 +0200
Message-ID: <CACRpkdZcVwvBHrDy-wxPURhJ4OWRMA9TQ1e2vmcXnhEG2HaMDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Drop referenced nodes in
 examples
To: Rob Herring <robh@kernel.org>
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 9:21 PM Rob Herring <robh@kernel.org> wrote:

> The additional nodes in the example referenced from the pinctrl node
> 'aspeed,external-nodes' properties are either incorrect (aspeed,ast2500-lpc)
> or not documented with a schema (aspeed,ast2500-gfx). There's no need to
> show these nodes as part of the pinctrl example, so just remove them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied. Concerns about lost examples can be solved
with incremental patches on top adding more schema.

Yours,
Linus Walleij
