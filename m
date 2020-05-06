Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACC1C7A63
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 May 2020 21:36:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HRg41mxPzDqvD
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 May 2020 05:36:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HRfv2ZkDzDqtp
 for <linux-aspeed@lists.ozlabs.org>; Thu,  7 May 2020 05:36:38 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id r25so2846788oij.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 06 May 2020 12:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rnfpFrTk6qQXOr8sM3/2W6CmEzipxR2+8pAqFytyXqI=;
 b=CroYtBQwwMz96bqcdZb8vrsWFHrLWibGP66lva/sjRF7Gh6QVMwB9/WLd9LHBPOE+o
 LI9nyU5lt0O2xJfkN7tC1kqjF6bDrK8pR5cDBcJR6YgBFeR1PgPDSCbuKY4bVJvmR1Do
 20ZT84zuXIDnf7BphI7iuwchonMpv8DHlzqBjuM4Pd09J0jJihMLy+FIEMromwPRyT+N
 GHkTy3pyU+VAv8uZ8PLDgLcBf1adj9tQqSv2FlXQ7+hEF9oKaXU9MWHIaS/0tJUdsQZr
 zYEIFVdBSYqK74H376KfTd1XhThCwiWSrIXvytbFrgBB5+n2Li2YGmIYjXrYp9iCjUMY
 OHPg==
X-Gm-Message-State: AGi0Pua0GuMf6iHomMAIQDeuXkQv5mNfw3XgVcYvjuwF80dhXKTwOYC2
 6cSFkahRJ6wLAu88rui7xg==
X-Google-Smtp-Source: APiQypK/PKmOgedCZiIdqA69OthKkxGU0LMfRCwhmWEdBjKXwWsK4lkiQOyMamTfj38oAd46ZV0DbA==
X-Received: by 2002:aca:4541:: with SMTP id s62mr4017103oia.100.1588793795634; 
 Wed, 06 May 2020 12:36:35 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s69sm770207otb.4.2020.05.06.12.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 12:36:34 -0700 (PDT)
Received: (nullmailer pid 21850 invoked by uid 1000);
 Wed, 06 May 2020 19:36:34 -0000
Date: Wed, 6 May 2020 14:36:34 -0500
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH v11 1/8] dt-bindings: soc: Add Aspeed XDMA Engine
Message-ID: <20200506193634.GA21647@bogus>
References: <1588697905-23444-1-git-send-email-eajames@linux.ibm.com>
 <1588697905-23444-2-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588697905-23444-2-git-send-email-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue,  5 May 2020 11:58:18 -0500, Eddie James wrote:
> Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../devicetree/bindings/soc/aspeed/xdma.yaml       | 103 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 ++
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
