Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE3F35C770
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Apr 2021 15:20:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJq9C5ttmz30Ff
	for <lists+linux-aspeed@lfdr.de>; Mon, 12 Apr 2021 23:20:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.180;
 helo=mail-oi1-f180.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJq9B5LSwz303M
 for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Apr 2021 23:20:13 +1000 (AEST)
Received: by mail-oi1-f180.google.com with SMTP id k18so8469373oik.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 12 Apr 2021 06:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=5n3lwv9EjfPJBx+21UO8C42pguWqHmFLoVLJG4Pmt/8=;
 b=QYexNQnzs3JABJ11k1rkZ9FgFElB3xknEZFiUyjTPD+D9Fn7icVYS613724TyCuh3q
 v2kD8H3xFCvqqwRU0+d59wwYUxLfMAU3UxIEGp1pkrv0FQsNOEWUPYLZOrjI0KKwJX8R
 cZvZbqRB8B58VXSj+sr9a96DvvI+iv3g3EZWTxJPWppcbA6mPxy2HAv7UamPfwbf1ORO
 KG8PmHgpYmPVCpdX88eaVFHsAzF6HcrZoXmhePrEE5YStFOKyjRdlz6AXf4yXREwJGpa
 IdKfToqECUH1Z42VidXw0SH++xrCN6mj5EnLDvxBVSuD91lC+v1W8LD6iGdOSjpKhK6x
 tpyg==
X-Gm-Message-State: AOAM530C2eWYOnBj3/2OxtQaS9d2m4rTlsAa6v8xvLIInrkZibJ3NTXd
 p9Lhjl7GbiJM+LWkRzXwJQ==
X-Google-Smtp-Source: ABdhPJxkwQARah6Q/rf1DbNTOAJlUzHL9osoUKpq9VAyJPVrU6baUsVLQdOFRK5Og/wakyM83q8y4Q==
X-Received: by 2002:a05:6808:b09:: with SMTP id
 s9mr19069272oij.36.1618233610277; 
 Mon, 12 Apr 2021 06:20:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 3sm2636995otw.58.2021.04.12.06.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:20:09 -0700 (PDT)
Received: (nullmailer pid 3757980 invoked by uid 1000);
 Mon, 12 Apr 2021 13:20:00 -0000
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
In-Reply-To: <20210412095457.15095-3-billy_tsai@aspeedtech.com>
References: <20210412095457.15095-1-billy_tsai@aspeedtech.com>
 <20210412095457.15095-3-billy_tsai@aspeedtech.com>
Subject: Re: [PATCH 2/4] dt-bindings: Add bindings for aspeed pwm
Date: Mon, 12 Apr 2021 08:20:00 -0500
Message-Id: <1618233600.223110.3757979.nullmailer@robh.at.kernel.org>
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
 robh+dt@kernel.org, thierry.reding@gmail.com, billy_tasi@aspeedtech.com,
 p.zabel@pengutronix.de, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 12 Apr 2021 17:54:55 +0800, Billy Tsai wrote:
> This patch adds device bindings for aspeed pwm device which should be
> the sub-node of aspeed,ast2600-pwm-tach.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: Additional properties are not allowed ('pwm-cells' was unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: Additional properties are not allowed ('pwm-cells' was unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.example.dt.yaml:0:0: /example-0/pwm_tach@1e610000: failed to match any schema with compatible: ['aspeed,ast2600-pwm-tach', 'simple-mfd', 'syscon']
Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.example.dt.yaml:0:0: /example-0/pwm_tach@1e610000/pwm@0: failed to match any schema with compatible: ['aspeed,ast2600-pwm']

See https://patchwork.ozlabs.org/patch/1465116

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

