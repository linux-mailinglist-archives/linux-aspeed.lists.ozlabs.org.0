Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 224D9391819
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 May 2021 14:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqrYL0zvyz2yY7
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 May 2021 22:56:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.48; helo=mail-ot1-f48.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqrYF1JSrz2xtp
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 May 2021 22:56:16 +1000 (AEST)
Received: by mail-ot1-f48.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so885692oth.8
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 May 2021 05:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=iXkqXiBQsewY7UKLQHq7T0TF8tElAuseKNt3ptiyGJ4=;
 b=lm4Z0g/IIHS4upMNkhOoNoekSIkV8zNdtPBmEpBhqwpM1it2ZkxKBJCcA5gNxNqfb5
 OZ/Nlwfo2T8CG3yaGPC9KYeqdaWrVul4koHD04uDcF8c54vcZdSgxwIPsYN5OA2XVi7I
 DGDiBf2UsZ42l70oXgVyX+YaSK8309VZ/fUUeuPv3AWKd1ufJedEz4asFLOOmn2TSj4p
 rA2APGZjDz6fimMyAtEhNu3muJWXY3XSMkViYyBn2Mur4s9sV13bGg8ESe2QQK0jOzIA
 hEAdfot8WcsERHj84w6jvrW2MW2lsbLL8ZSNXPLRoO72LaIXq0Iy3z/bIfICbjam+xKJ
 fs4A==
X-Gm-Message-State: AOAM532+Yo7fC2wH8dixnTw4e9KTCoEtVdQ8k1a1H8Xy1B+q5IMyFAkc
 k3gQi99eb0pn8t7kgz3t9w==
X-Google-Smtp-Source: ABdhPJx1SX2j4YDypYABA+wb3uBPh/k8hKTtGDCXeEygHSeYOGOPwQMV2VN+T2/oZmGj5M3Tp+Treg==
X-Received: by 2002:a05:6830:2472:: with SMTP id
 x50mr2212909otr.277.1622033773373; 
 Wed, 26 May 2021 05:56:13 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x65sm4411042otb.59.2021.05.26.05.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:56:12 -0700 (PDT)
Received: (nullmailer pid 2377039 invoked by uid 1000);
 Wed, 26 May 2021 12:56:03 -0000
From: Rob Herring <robh@kernel.org>
To: Steven Lee <steven_lee@aspeedtech.com>
In-Reply-To: <20210526094609.14068-2-steven_lee@aspeedtech.com>
References: <20210526094609.14068-1-steven_lee@aspeedtech.com>
 <20210526094609.14068-2-steven_lee@aspeedtech.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: aspeed-sgpio: Convert txt bindings to
 yaml.
Date: Wed, 26 May 2021 07:56:03 -0500
Message-Id: <1622033763.789353.2377038.nullmailer@robh.at.kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongweiz@ami.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 26 May 2021 17:46:05 +0800, Steven Lee wrote:
> SGPIO bindings should be converted as yaml format.
> In addition to the file conversion, a new property max-ngpios is
> added in the yaml file as well.
> The new property is required by the enhanced sgpio driver for
> making the configuration of the max number of gpio pins more flexible.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../bindings/gpio/aspeed,sgpio.yaml           | 91 +++++++++++++++++++
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt | 46 ----------
>  2 files changed, 91 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/sgpio-aspeed.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpio/aspeed,sgpio.yaml#

See https://patchwork.ozlabs.org/patch/1483966

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

