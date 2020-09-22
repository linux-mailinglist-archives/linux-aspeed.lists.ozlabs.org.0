Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A08D4274C46
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Sep 2020 00:39:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bwx896wDXzDqVv
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Sep 2020 08:39:53 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.194;
 helo=mail-il1-f194.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwx83224NzDqVl
 for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Sep 2020 08:39:45 +1000 (AEST)
Received: by mail-il1-f194.google.com with SMTP id a19so18926918ilq.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 22 Sep 2020 15:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KP/bIax8AYxevHceHULkcS4me70aHkKP7ZGYXm7vv54=;
 b=d0xbwZmQTURiXd90UY4j8tKtjLj7lkpYunmEo6q0Q1at6cN4sefIf8dkog1gL/nYUx
 4jXjUYygQ8mKMprLjVJq9ZtGeIoIha2BdmOohwDc4UjxVajwrf2W6Ad6iHrsvvacd0l4
 NYmOmZ8MLbI23nGj39AbsQW5FqV91eY1q8rqSf9Y6Vd+mfDtcYsvGPyYeGh4+YWcMf/p
 2DH7EffYGwW2gvbMTT6jA4HXtFRx5I4i/t9i6DiovAztZ3zdZ1HcJr/jr8kGHMJ5KDYU
 QEUVYYj++t35jNpgOeKRqdBqxaujUMJd+hiGH48v530Q7KRehWsWtlPPRYF2DI2HfOaD
 eIqA==
X-Gm-Message-State: AOAM531rjOe0HTqtXlcFaWVqsznipwlxAIz7WfmaxeDASTUhAOhM9GCH
 CzDZ4afYhc7CIBwPFbTRfg==
X-Google-Smtp-Source: ABdhPJy/D45MSIrtIxNDveJ1FlhelEkEb4ukAbZHwXhyxMtJXSjWg4yZn0PGGjL0bwqExLSA7b0r3Q==
X-Received: by 2002:a92:dd8a:: with SMTP id g10mr4497927iln.125.1600814383453; 
 Tue, 22 Sep 2020 15:39:43 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g1sm9786940ilh.12.2020.09.22.15.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 15:39:42 -0700 (PDT)
Received: (nullmailer pid 3391337 invoked by uid 1000);
 Tue, 22 Sep 2020 22:39:40 -0000
Date: Tue, 22 Sep 2020 16:39:40 -0600
From: Rob Herring <robh@kernel.org>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] gpio/aspeed-sgpio: enable access to all 80 input
 & output sgpios
Message-ID: <20200922223940.GA3391274@bogus>
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911015105.48581-1-jk@codeconstruct.com.au>
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
 linux-gpio@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 11 Sep 2020 09:51:04 +0800, Jeremy Kerr wrote:
> Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> corresponding to the 80 status bits available in hardware. Each of these
> lines can be configured as either an input or an output.
> 
> However, each of these GPIOs is actually an input *and* an output; we
> actually have 80 inputs plus 80 outputs.
> 
> This change expands the maximum number of GPIOs to 160; the lower half
> of this range are the input-only GPIOs, the upper half are the outputs.
> We fix the GPIO directions to correspond to this mapping.
> 
> This also fixes a bug when setting GPIOs - we were reading from the
> input register, making it impossible to set more than one output GPIO.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> 
> ---
> v2:
>  - Fix warnings from kbuild test robot
>  - Add comment for input/output GPIO numbering
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt |   5 +-
>  drivers/gpio/gpio-aspeed-sgpio.c              | 126 ++++++++++++------
>  2 files changed, 87 insertions(+), 44 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
