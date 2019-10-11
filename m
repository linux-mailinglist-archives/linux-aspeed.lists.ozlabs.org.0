Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F50D4619
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 19:02:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qZ4m40wzzDqZD
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2019 04:02:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qZ4b6vFlzDq75
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 04:02:07 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id z6so8570211otb.2
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vjnGO7jy/uIgC7C69kaFRlAqhB7BSVIYFxY9GpNzQxs=;
 b=aE2GmsYNUA+BQGQfSo6ZKZ4UjeXYdmyGbQj7puywKH439tQYToHDtHBxgwq+3otGXt
 QbrmBjeTuJ8fShtQ0IJIuK2OxVnGNa8NItl4I9b7n5bqK8aWDOc0qe68d0fthjkItnKI
 q1vUALZgDKwX3s+2earD1oJXefXqHpIii3cD4TcoPLqQkAOPJ0u3yv7oNSUxbtnxZSkI
 RsBF06/jd18qtHD8nn6AVfEPSKAOHBqj6wqK/yZBYVkXLFvIXTiWUnqiCalGg0/IT+xd
 W4TzeK3gHtxpODpz3f2XHvJdLRIgIFxheFgf+BeqlS4sLm1opJYu20lccNS/eDcxY1qc
 RAwA==
X-Gm-Message-State: APjAAAUCI3g/GRtwN6IW7rLPO4wlAVPUIHVJXUNmIjka14VzzIq1uOVK
 EGigscGXSFVj2sqIR+wCKA==
X-Google-Smtp-Source: APXvYqwfy0Na/MAFrRtPiSxZm/TDuDknMJwUXkcoSJDIX13TLHyRN+sMhY1EV3oTRDG1UunWf6kqIg==
X-Received: by 2002:a9d:6b0a:: with SMTP id g10mr13237581otp.303.1570813324600; 
 Fri, 11 Oct 2019 10:02:04 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a69sm2791021oib.14.2019.10.11.10.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 10:02:03 -0700 (PDT)
Date: Fri, 11 Oct 2019 12:02:03 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 2/3] dt-bindings: net: ftgmac100: Describe clock
 properties
Message-ID: <20191011170203.GA16724@bogus>
References: <20191010020756.4198-1-andrew@aj.id.au>
 <20191010020756.4198-3-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010020756.4198-3-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, davem@davemloft.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Oct 2019 12:37:55 +1030, Andrew Jeffery wrote:
> Critically, the AST2600 requires ungating the RMII RCLK if e.g. NCSI is
> in use.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/net/ftgmac100.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
