Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF9D42F6
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 16:34:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qVnf2JWCzDqc4
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2019 01:33:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qVnY1KNbzDqYb
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 01:33:52 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id 60so8141053otu.0
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 07:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=13+exJToatmaIzt24oxwTrGZYM7rrhfRGi/WJDiOBwA=;
 b=GWv8Z/KejUjUG4QCjQbJ498ruTXapBaKbiXSL2WP7CAHSXjwVOD5br+QUDbaczezIS
 Rfv+eL/cGk+CAgvQz77f/bR9YVwWIXw+HwvRB+CfxeiS92nUrCDZUe7R2F98uJOjqtBk
 4ixELZvw5sv0ZjWLdjqFXAwk5A9HUdrMwpm436A1BQpfW16Pq4af9K46NNeyxkmaGRiL
 qvip8pmD6hGIIOkWsfGVccwGxEPbS9CeOWLYrjtcEREZQXTZpIkAGCs9SOjNg9PLwHsI
 qN6r7hA2dcqUugBiXlMIRETV3kGonbDY2hXNOp8XC9Cc70aAd60X4L7K9gVXxWxQ5ul2
 VWgg==
X-Gm-Message-State: APjAAAVqARVHWF3mFAhzvW+wCIQfciW6sLPO4wI4/62s7brYL0oVAQAZ
 fNzsSW/mJckCX43m5jn+Pg==
X-Google-Smtp-Source: APXvYqwgioBIlOsE8YnkGA0AfZmGlUiR67ETRFc335JqHw8L5b/6qB4u2WDleLxV+K+60E0+AtJRLg==
X-Received: by 2002:a9d:5e12:: with SMTP id d18mr12786439oti.220.1570804429525; 
 Fri, 11 Oct 2019 07:33:49 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w201sm2694172oie.44.2019.10.11.07.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 07:33:49 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:33:48 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: interrupt-controller: Add Aspeed SCU
 interrupt controller
Message-ID: <20191011143348.GA22630@bogus>
References: <1569617929-29055-1-git-send-email-eajames@linux.ibm.com>
 <1569617929-29055-2-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569617929-29055-2-git-send-email-eajames@linux.ibm.com>
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

On Fri, 27 Sep 2019 15:58:46 -0500, Eddie James wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
