Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C280D460B
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 19:01:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qZ3h0RmDzDqch
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2019 04:01:20 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qZ3R6DSwzDqZG
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 04:01:07 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id 21so8535389otj.11
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=39fE6RD4L7ek9/ZP7eb4uAgC4lVSQDHBffdSIup/Xc0=;
 b=dXI09mXxslMhgWgC60HlW2IOhWgVW31aSEG2685Y2FhAI7hZ05MLHH24Cpjf7UV+Ix
 51T+YM7A6Dw3gtbElYJlZc07NjCP8g/tmcISLMGbknbKaqfGecTT3yuOcucpBjsmwB0B
 kqxcqpQpMPCBTRbdUS5xOXXrTdRudPMXBb5M9PfuNH+MzFN76MnRH8MPKhVd6qr7WqPH
 ZHW7zjwN4q21bUnQEZSa9m81da3vm9bHawlZ5F9RMZQfdAy5Q5lUD8rXdjeIYh/A/QxR
 GkhBgbTHfTNmkXZ3upjPyCClKLAGf/quwhgTFocll/Knk/q42WhfUsJ4RQuzz51mW24U
 J58Q==
X-Gm-Message-State: APjAAAWeWGYm6KrsM4Q8Hazbdw9HPPjZJt5dLzh0ujYGgio1gJh/smHC
 bZJn6X8NxX73ll3TKp8+hw==
X-Google-Smtp-Source: APXvYqwqGqT7uiHwhdBc7sqpGqwD6vjshKpmaDTSjaMTHJz7K2u/gcWBWDVEgXQTXZ2+vioVbwWrOg==
X-Received: by 2002:a05:6830:119a:: with SMTP id
 u26mr13662087otq.166.1570813265021; 
 Fri, 11 Oct 2019 10:01:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 91sm2915769otn.36.2019.10.11.10.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 10:01:04 -0700 (PDT)
Date: Fri, 11 Oct 2019 12:01:03 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add AST2500 RMII RCLK
 definitions
Message-ID: <20191011170103.GA14903@bogus>
References: <20191010020655.3776-1-andrew@aj.id.au>
 <20191010020655.3776-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010020655.3776-2-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Oct 2019 12:36:54 +1030, Andrew Jeffery wrote:
> The AST2500 has an explicit gate for the RMII RCLK for each of the two
> MACs.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> v2: Drop "_GATE" from symbol names
> 
>  include/dt-bindings/clock/aspeed-clock.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
