Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8403E2D2226
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 05:41:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqnZR3q6kzDqZQ
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Dec 2020 15:41:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=aLVRcQaW; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqnZK6kvdzDqKL
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Dec 2020 15:41:29 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id h20so15002216qkk.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Dec 2020 20:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xAIRxZDmd0XZZCAdm94Qdv5VUeF43D2RsyIh6eKGGf8=;
 b=aLVRcQaWSKpqoJIePAI/5QzPxQis2faRVW/VFZ5UJWPmGydXf4tn/RZpEMzb2WFAgA
 ecaOidkljzudozM+9Z4VuaDaSPcF7zyZOrf/21oPrNahZWyBwU20gtPfvo15L735ARN2
 5o9Df56HE0F2Hpu6st6+7pn77TpmF5xKV3xwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xAIRxZDmd0XZZCAdm94Qdv5VUeF43D2RsyIh6eKGGf8=;
 b=Rc5LOMCUB9ezoD5kJL4OJFg6aJ1WYpo1vBn1gailaNWCaKA+QaXe5AG44mqFrASfqp
 dOI6WlVqn8/l7rwG0yGgCttnbk2zfFUSlhoc5R/i7jLxWsB1NY6oV7dO5n2J0EZ0Y+5c
 2gTiHbG57BVwgvjsUGFlk4u2Mv1UoQhr23TxyaTZTsgQZTFj+sS0DNKwBUXTCAWzTDJn
 ogr+i4mizdt7jfwbarWb12vPwiJOqpAq0Ef+KBDTfWqynjCDDI13jWLFRZXajZvn6K99
 d1Bt3ys6MPr8YK3aVqQXLg6u7h6p7KdBP3T8W6wrZ2yWS6f6C0mks17vd5uzWh3JJYic
 zg2w==
X-Gm-Message-State: AOAM5327OcYp1bAJ825txpObYADF9gNckVD4gxTAWeqOxb+SHiRlf0U0
 KCUhCVLbxMZkdjnez4P8HiwOuVrkSJ1VkuESqkQ=
X-Google-Smtp-Source: ABdhPJxmdrw0TtSmL+AL8U2C/OLTmrt1tudiPGj4GJBtaDoK7gFoLVARHFL4NtJMz5F6gpjMaNv/0eKZoOfHassNv9c=
X-Received: by 2002:a05:620a:7e8:: with SMTP id
 k8mr27401044qkk.273.1607402485842; 
 Mon, 07 Dec 2020 20:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20201208043700.23098-1-quan@os.amperecomputing.com>
 <20201208043700.23098-2-quan@os.amperecomputing.com>
In-Reply-To: <20201208043700.23098-2-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Dec 2020 04:41:11 +0000
Message-ID: <CACPK8Xcs6ED5C_2RHrG0Bipn8sjPK7yBjcYvJ=UT6w2SRm0swQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: vendor-prefixes: Add an entry for
 AmpereComputing.com
To: Quan Nguyen <quan@os.amperecomputing.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, allen <allen.chen@ite.com.tw>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Rob,

On Tue, 8 Dec 2020 at 04:37, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> Add "ampere" entry for Ampere Computing LLC: amperecomputing.com
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>

Do you take this through your tree?

Cheers,

Joel

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 3a76c226771b..a83fa090f3d4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -85,6 +85,8 @@ patternProperties:
>      description: Shenzhen Amediatech Technology Co., Ltd
>    "^amlogic,.*":
>      description: Amlogic, Inc.
> +  "^ampere,.*":
> +    description: Ampere Computing LLC
>    "^ampire,.*":
>      description: Ampire Co., Ltd.
>    "^ams,.*":
> --
> 2.28.0
>
