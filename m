Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D551460B5EE
	for <lists+linux-aspeed@lfdr.de>; Mon, 24 Oct 2022 20:44:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx3rx4zc1z3bvs
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Oct 2022 05:44:33 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.51; helo=mail-oa1-f51.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx3rq0YDpz2xH8
	for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Oct 2022 05:44:26 +1100 (AEDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-13bd19c3b68so2189693fac.7
        for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Oct 2022 11:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4upE6rPkUg1Kk48qduhvrFmJwYjPpk30APYeg6GV6w=;
        b=TApRhVszSgq2stBYrH/M6I6QvfzKdxSKtjRJVG9TSIQ5TrD5o4dSaFDllcFwv+uAEZ
         BtclvdaXL2SWi5Nl+KXMFONZo7z7DAsxQdOaVOwCWSWtqyaHA8a+fHAJE0uD0CilrjAE
         3+sGh6KqdUb3cuD5M8625JUZfZq/wn/I62BoYwdP3MXgqZBLv77CAw89YulxLCCgG22P
         lUrcKvUqpltPyFRRfhNViCo2ifc2xgWPKQSjWqmIsfIsU+0QOsJI+U3MPGySu6tGZDsk
         lVbwOi+NKfQsTi0kL4rqw1B9CKrC1hjvuxwrZMWiUW2cqUgrVg2ODDGZGlV6CkhSJ4oZ
         T2lA==
X-Gm-Message-State: ACrzQf1F12jJgdAUtKtNLWaOoQNHM0gxFIDT9+rXtloGbRRj1v1V1Vqp
	Ch+3MJIx9zp4aW9+euNiGoJIyZarmQ==
X-Google-Smtp-Source: AMsMyM6cky/yW1ZgEHaZQNSvu4CwhoYu/Fp9DZ/gEyYJFP3Btfjl8wSbjLryLSStc/QbxTWG7tZnMQ==
X-Received: by 2002:a05:6870:3052:b0:131:932c:3316 with SMTP id u18-20020a056870305200b00131932c3316mr20789918oau.288.1666637062744;
        Mon, 24 Oct 2022 11:44:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q14-20020a4adc4e000000b00480b7efd5d9sm307974oov.6.2022.10.24.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 11:44:22 -0700 (PDT)
Received: (nullmailer pid 2030017 invoked by uid 1000);
	Mon, 24 Oct 2022 18:44:23 -0000
Date: Mon, 24 Oct 2022 13:44:23 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: aspeed: Document
 aspeed,pre-timeout-irq-us
Message-ID: <20221024184423.GA2023764-robh@kernel.org>
References: <20221021151559.781983-1-eajames@linux.ibm.com>
 <20221021151559.781983-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021151559.781983-3-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 21, 2022 at 10:15:59AM -0500, Eddie James wrote:
> Document this new property for the pre-timeout interrupt.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index a8197632d6d2..81d2c35ca7e3 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -40,12 +40,17 @@ Optional properties:
>  			specified no external signal is sent.
>   - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
>  
> -Optional properties for AST2500-compatible watchdogs:
> +Optional properties for AST2500 and AST2600 compatible watchdogs:
>   - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
>  			 drive type to push-pull. The default is open-drain.
>   - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
>  			   is configured as push-pull, then set the pulse
>  			   polarity to active-high. The default is active-low.
> + - aspeed,pre-timeout-irq-us: If aspeed,pre-timeout-irq-us is non-zero, the
> +			      pre-timeout interrupt will be enabled for the
> +			      watchdog. The interrupt will fire the specified
> +			      number of microseconds before the watchdog expires
> +			      and trigger a kernel panic.

A pre-timeout interrupt is fairly common. Come up with a common property 
please. You'll need to be clear if the time is from wdog restart or time 
before final timeout. 

Rob
