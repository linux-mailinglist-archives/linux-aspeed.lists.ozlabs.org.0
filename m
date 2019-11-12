Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37655F85DD
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 02:06:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BqMc4VMNzF504
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 12:06:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bq610FrbzF4Gn
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 11:55:04 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id y194so13280497oie.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 16:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pBpMOp1pnVgL27PeyDlmextXWELG5e17FH+NqeYI5mE=;
 b=XZqfnXC3nTvkMN9aKnQiLDgZAGQh76StPBCD3I+E7AoyBR6qy7aF9Ny0NhcT7lpenQ
 DO3cU6CIUkJNfsGBFzVGizLMBdjEVkGKSKREXT3gWE//tYCdEw6SiA0dKD/Z6/MSeP7l
 jjWTBqywnSy8M/Dn8/Tbz23hIpifO85UCjDTIfVtwgG+77WSkJ+sL4o/OtdutOfWAZR5
 EkFMeyiSfoFNDNjOXSg/hnbnAwaDgGZfwAkYAgNgZuWUK9yTci1FRLLOnfvEbxKpO+Pb
 SLuhrkzkwomhj32HBzWo71LFn6LR++dqDNnKkfONLAqiAMi8Vtbh01+olf8xSByhfvw7
 MKdQ==
X-Gm-Message-State: APjAAAWunt6ELFN3lSIVl5/mbwZCU2ZiyuoG1QabMQnqCz4lV263xOy3
 nK1JPT763uUT22ig1qXHXw==
X-Google-Smtp-Source: APXvYqyljVDthsZCN8eV9945YzI8i3G/6sNTkp6Sv0OOGAYMLdcUA3NT8bIiajw8luXTBalycNC9pA==
X-Received: by 2002:a05:6808:106:: with SMTP id
 b6mr1537840oie.44.1573520100283; 
 Mon, 11 Nov 2019 16:55:00 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 94sm5835461otg.70.2019.11.11.16.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 16:54:59 -0800 (PST)
Date: Mon, 11 Nov 2019 18:54:59 -0600
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 01/12] dt-bindings: interrupt-controller: Add Aspeed SCU
 interrupt controller
Message-ID: <20191112005459.GA6260@bogus>
References: <1573244313-9190-1-git-send-email-eajames@linux.ibm.com>
 <1573244313-9190-2-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573244313-9190-2-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jason@lakedaemon.net,
 linux-aspeed@lists.ozlabs.org, maz@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, tglx@linutronix.de
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri,  8 Nov 2019 14:18:22 -0600, Eddie James wrote:
> Document the Aspeed SCU interrupt controller and add an include file
> for the interrupts it provides.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../interrupt-controller/aspeed,ast2xxx-scu-ic.txt | 26 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++++++
>  .../interrupt-controller/aspeed-scu-ic.h           | 23 +++++++++++++++++++
>  3 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2xxx-scu-ic.txt
>  create mode 100644 include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
