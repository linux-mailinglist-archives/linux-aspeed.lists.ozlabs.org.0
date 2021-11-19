Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 562F7456746
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 02:08:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwJSv1dzqz305X
	for <lists+linux-aspeed@lfdr.de>; Fri, 19 Nov 2021 12:08:31 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.48; helo=mail-oo1-f48.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwJSr6s1dz2yPd
 for <linux-aspeed@lists.ozlabs.org>; Fri, 19 Nov 2021 12:08:28 +1100 (AEDT)
Received: by mail-oo1-f48.google.com with SMTP id
 d1-20020a4a3c01000000b002c2612c8e1eso3131052ooa.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 18 Nov 2021 17:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nl07X1pqpx8geRh2cxLd4Ju9lF6KwEfmJ0AkwUACphE=;
 b=XaXVCUqaQWDmq8dKnQnIePs0e2NcVFE7F35qTD5zL6fqSG16GuuYXzozidvLsSFo03
 bxuMhHNU2Hjgo59LZDlVI5YE4BHFX6v/+X3HHQLmriiembMQacf0tVbZvsgp3V1JT7Sh
 R04c8tkNbwwKWm6gp/jFDovSta9IGl59Tlju8nT5+xQrdHdcEd+lKT38TzPGjR5vU8TD
 Cj7G63tpmYjLnw5lYqLTVc+f/5wCRSONMzXpXYr2GL1iIi56ACmveUJEWwUERI1hFlIi
 s5mWIPMl9ATMHXdVWUMTifIlK4eUCHYCyTE296OUw+y2+bHB+sHEYNhcYrBn69j14msy
 GlFQ==
X-Gm-Message-State: AOAM532WhvkZw6geSwmaFEODtVDOmjjLW8foYHIA4ZBnknkOHMJ8rZWW
 Q4djzN1W14Cttye/upqUpg==
X-Google-Smtp-Source: ABdhPJwnZGC6mR/cCWiBVybeXex5u15BXVqI6oLYPz4nNpWFmHoWYbOfOoCXlxh6JjWrV3eb8Xu00g==
X-Received: by 2002:a4a:d48c:: with SMTP id o12mr15793590oos.55.1637284106636; 
 Thu, 18 Nov 2021 17:08:26 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n20sm299854ooe.7.2021.11.18.17.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 17:08:26 -0800 (PST)
Received: (nullmailer pid 2150728 invoked by uid 1000);
 Fri, 19 Nov 2021 01:08:25 -0000
Date: Thu, 18 Nov 2021 19:08:25 -0600
From: Rob Herring <robh@kernel.org>
To: jae.hyun.yoo@intel.com
Subject: Re: [PATCH v3 5/6] dt-bindings: ipmi: aspeed,kcs-bmc: add 'clocks'
 as a required property
Message-ID: <YZb5CWKRXdVUzaB6@robh.at.kernel.org>
References: <20211108190200.290957-1-jae.hyun.yoo@intel.com>
 <20211108190200.290957-6-jae.hyun.yoo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108190200.290957-6-jae.hyun.yoo@intel.com>
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
Cc: devicetree@vger.kernel.org, Haiyue Wang <haiyue.wang@linux.intel.com>,
 Corey Minyard <minyard@acm.org>, linux-aspeed@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, openipmi-developer@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 08 Nov 2021 11:01:59 -0800, jae.hyun.yoo@intel.com wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> If LPC KCS driver is registered ahead of lpc-ctrl module, LPC KCS
> hardware block will be enabled without heart beating of LCLK until
> lpc-ctrl enables the LCLK. This issue causes improper handling on
> host interrupts when the host sends interrupts in that time frame.
> Then kernel eventually forcibly disables the interrupt with
> dumping stack and printing a 'nobody cared this irq' message out.
> 
> To prevent this issue, all LPC sub drivers should enable LCLK
> individually so this patch adds 'clocks' property as one of
> required properties to enable the LCLK by the LPC KCS driver.
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
> Changes sinve v1:
>  * Added 'clocks' property into kcs-bmc bindings using
>    'aspeed,ast2400-kcs-bmc.yaml' because it's not merged into
>    'aspeed-lpc.yaml' yet. The bindings merging could be done using a
>    separate patch later.
> 
>  .../devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml   | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
