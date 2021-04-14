Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A5935F681
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Apr 2021 16:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL54h4jdQz30HQ
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Apr 2021 00:50:44 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.43; helo=mail-ot1-f43.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL54d38y7z304Y
 for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Apr 2021 00:50:39 +1000 (AEST)
Received: by mail-ot1-f43.google.com with SMTP id
 v19-20020a0568300913b029028423b78c2dso10948108ott.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Apr 2021 07:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=imFjAaiBjLT6LuL67d8A8g+gXv6wR7zTuwnflF5k37w=;
 b=ESCyuZ3R8lPmZKg0f6A+5AYi4NQmDvXsqHrsBhTiwOWzRciopTg7woUa2imveqo+9F
 nKlbKec9QyM6UollJwAFeAG8/V/0xqCPZLS5ZgOXeHChd/3gACz9cvoWhqPhJWOiqEBE
 ldHpXhR7tF3HFC4YZZ8L47p3VpfRjZ0DCcAXGseIVB26DX/suBaFEQHekl9u/s8Ek8v8
 225XYXQ08ZoC9FAL0Bq8B1e/XZf0a34ktp6XR62/nBnjRqlRzjK2Eo4oth3Ulf4xvxkI
 ao7alMhtwyZ+Oas10cPjdq+wx93EqkiUGh54faYLAvSzLOQb68tIY5VY/LiceD6lKg4h
 EkrA==
X-Gm-Message-State: AOAM530dL7/atZeVdKHun1OquRyPZ6nyeyMt47EXskF66jJhLRLAZ0bN
 ThpH0TTiqRDgskdgPT2H9A==
X-Google-Smtp-Source: ABdhPJx1p2gizTVe4suB3LooLj3w41cuF7yA9Nfe6OWEggQibFEqD0ctuHDjC/AXQoFjiBzMECorGw==
X-Received: by 2002:a9d:7ac6:: with SMTP id m6mr372889otn.350.1618411835755;
 Wed, 14 Apr 2021 07:50:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v195sm3653919oia.38.2021.04.14.07.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 07:50:34 -0700 (PDT)
Received: (nullmailer pid 3605229 invoked by uid 1000);
 Wed, 14 Apr 2021 14:50:33 -0000
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20210414104939.1093-2-billy_tsai@aspeedtech.com>
References: <20210414104939.1093-1-billy_tsai@aspeedtech.com>
 <20210414104939.1093-2-billy_tsai@aspeedtech.com>
Subject: Re: [v2 1/2] dt-bindings: Add bindings for aspeed pwm-tach and pwm.
Date: Wed, 14 Apr 2021 09:50:33 -0500
Message-Id: <1618411833.809131.3605228.nullmailer@robh.at.kernel.org>
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
 linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, p.zabel@pengutronix.de,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 14 Apr 2021 18:49:38 +0800, Billy Tsai wrote:
> This patch adds device bindings for aspeed pwm-tach device which is a
> multi-function device include pwn and tach function and pwm device which
> should be the sub-node of pwm-tach device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Change-Id: I18d9dea14c3a04e1b7e38ffecd49d45917b9b545
> ---
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 60 +++++++++++++++++++
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 44 ++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.example.dt.yaml:0:0: /example-0/pwm_tach@1e610000/tach@1: failed to match any schema with compatible: ['aspeed,ast2600-tach']

See https://patchwork.ozlabs.org/patch/1466127

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

