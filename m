Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96405456742
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 02:07:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwJSF3xVZz2ypY
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 12:07:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.54; helo=mail-oo1-f54.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwJSB4sVfz2xtp
 for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Nov 2021 12:07:53 +1100 (AEDT)
Received: by mail-oo1-f54.google.com with SMTP id
 r18-20020a4a7252000000b002c5f52d1834so3157701ooe.0
 for <linux-aspeed@lists.ozlabs.org>; Thu, 18 Nov 2021 17:07:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J7xF1Ruy1Zsr5uKClLiAhJlFdT48GSxSjpTzyXQZLA0=;
 b=OVLDOQ6oriJiV1hKL9Tk8GNx6JaDrkBF/fpFK+T14e8C6u2vR/0HwuetmRBuiHqcD3
 kQ+pL1H1gbwFjzOo2vc33qUwyVPXMgZ0IKHitUKBetqei1iLaRg/iTW4xqrCcnu8p4OB
 XqLvHosRpxwQXinQg3AQjhHU7D+QFBj4ZM3MITlHSHSzD4cIQb3vF/+GjVmIOzQnDlgs
 Bjvxt6ul+xMsZ1VOjMJJJ8eefxpdx2/KRg51Uzskcun46oyiLA200H7XmC2IO622GSnA
 /1Fqw63cXrLMI97KMLFe4p73y4FPbiB2HGqvKyDLL8/QL5lO9uN5GJECr73VqjSNkbbX
 XGRw==
X-Gm-Message-State: AOAM5322vyz3472h+Go/wxwgzPNGqW+8/EDRWBYwBsGZ9tHRXN0t2dqZ
 2Vll+5EujexQN4ee7ahI9w==
X-Google-Smtp-Source: ABdhPJzKo6/FJsF2qo0j7tAC6njlrJY9RLRXANHnK2WNurzqGE9JuI5HAEV1whTDVB7SAhWJkWjctQ==
X-Received: by 2002:a4a:d284:: with SMTP id h4mr15642824oos.31.1637284070896; 
 Thu, 18 Nov 2021 17:07:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x16sm287467otq.47.2021.11.18.17.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 17:07:50 -0800 (PST)
Received: (nullmailer pid 2149582 invoked by uid 1000);
 Fri, 19 Nov 2021 01:07:49 -0000
Date: Thu, 18 Nov 2021 19:07:49 -0600
From: Rob Herring <robh@kernel.org>
To: jae.hyun.yoo@intel.com
Subject: Re: [PATCH v3 2/6] dt-bindings: ipmi: bt-bmc: add 'clocks' as a
 required property
Message-ID: <YZb45WLaOzRtW9+g@robh.at.kernel.org>
References: <20211108190200.290957-1-jae.hyun.yoo@intel.com>
 <20211108190200.290957-3-jae.hyun.yoo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108190200.290957-3-jae.hyun.yoo@intel.com>
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
 Corey Minyard <minyard@acm.org>, Cedric Le Goater <clg@kaod.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 08 Nov 2021 11:01:56 -0800, jae.hyun.yoo@intel.com wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> If LPC BT driver is registered ahead of lpc-ctrl module, LPC BT
> hardware block will be enabled without heart beating of LCLK until
> lpc-ctrl enables the LCLK. This issue causes improper handling on
> host interrupts when the host sends interrupts in that time frame.
> Then kernel eventually forcibly disables the interrupt with
> dumping stack and printing a 'nobody cared this irq' message out.
> 
> To prevent this issue, all LPC sub drivers should enable LCLK
> individually so this patch adds 'clocks' property as one of
> required properties to enable the LCLK by the LPC IBT driver.
> 
> Note: dtsi change in this patch series should be applied along with,
> and dtbs should be re-compiled after applying this series since
> it's adding a new required property otherwise the driver will not
> be probed correctly.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> v2 -> v3:
>  * Made commit message more descriptive.
> 
> v1 -> v2:
>  * Added 'clocks' property into ibt bindings using
>    'aspeed,ast2400-ibt-bmc.txt' because it's not merged into
>    'aspeed-lpc.yaml' yet. The bindings merging could be done using a
>    separate patch later.
> 
>  .../devicetree/bindings/ipmi/aspeed,ast2400-ibt-bmc.txt         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
