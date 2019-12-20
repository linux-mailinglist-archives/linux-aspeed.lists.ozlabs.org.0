Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF1B1271F8
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Dec 2019 01:01:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f86N4CsdzDqMK
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Dec 2019 11:01:16 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f86D1cJXzDqHF
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Dec 2019 11:01:05 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id w21so1651622otj.7
 for <linux-aspeed@lists.ozlabs.org>; Thu, 19 Dec 2019 16:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ixxxBsIzEckZyMKz6FP9blKKJXoRngv5HsAGvReLZD4=;
 b=R0A78WYv/3fs+YprQD36neEvlyEsO1CK/4eRWfYplRFGa1+cCit688zcQJiSY9FU2o
 InDzS2iBXc40jmXDK0fTycP2HdM9lYYNLdFe4nmq3ZBfZHuYfJeOLxLHBzTJtzuf1jWi
 LXbGLKy+gDazNl2BaBZHyPvvJVApfxseWVmWJBANyOv9Iz6dXoTHgcNSbJ0E07R+0krL
 lek6oWh1Bb+++dvVSN6SIDrwcOT5M4DFjk6u9ncyRj2TMpBFwGxjSgIwAivAsOHa6QlH
 QpOuwWrfRzh9UbY8V45igAH2x7u3mEGFE9iB94XExNS0DwYBuZv0CZKsIiq+Dn0bgLzK
 IUGg==
X-Gm-Message-State: APjAAAUoAmqy9AW4or7fXl/iQzpe9HNlfctpUFMPCxPihu38Y0b5IUld
 Z8JtFD9/CY99/l/CE+LAYQ==
X-Google-Smtp-Source: APXvYqzEJwtRPN0UXZ/xR2ptdwnUmxXBKOPtOTRVoyqaKCSz+7WnsyzpWFMgdicP0Vvzr157+uUKXg==
X-Received: by 2002:a9d:6a5a:: with SMTP id h26mr11893681otn.103.1576800062626; 
 Thu, 19 Dec 2019 16:01:02 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net.
 [184.205.174.147])
 by smtp.gmail.com with ESMTPSA id l128sm2541590oif.55.2019.12.19.16.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 16:01:02 -0800 (PST)
Date: Thu, 19 Dec 2019 18:01:01 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 1/3] dt-bindings: ipmi: aspeed: Introduce a v2 binding
 for KCS
Message-ID: <20191220000101.GA16104@bogus>
References: <cover.fe20dfec1a7c91771c6bb574814ffb4bb49e2136.1576462051.git-series.andrew@aj.id.au>
 <8aec8994bbe1186d257b0a712e13cf914c5ebe35.1576462051.git-series.andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8aec8994bbe1186d257b0a712e13cf914c5ebe35.1576462051.git-series.andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, minyard@acm.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, robh+dt@kernel.org,
 openipmi-developer@lists.sourceforge.net, haiyue.wang@linux.intel.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 16 Dec 2019 12:57:40 +1030, Andrew Jeffery wrote:
> The v2 binding utilises reg and renames some of the v1 properties.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> v2: Rename slave-reg to aspeed,lpc-io-reg
> 
> Rob: After our discussion about the name of 'slave-reg' on v1 I've thought
> about it some more and have landed on aspeed,lpc-io-reg. In v1 I argued that
> the name should be generic and you suggested that if so it should go in a
> generic binding document - I've thought about this some more and concluded that
> it was hard to pin down exactly where it should be documented if it were
> generic (the generic ASPEED LPC binding is one place, but that would suggest
> that the property is still ASPEED-specific; maybe some discussion with
> Nuvoton might give some insight).
> 
> Regardless, it turns out that the address specification is really
> ASPEED-specific in this case: The KCS host interface in the LPC IO space
> consists of a data and status register, but the slave controller infers the
> address of the second from the address of the first and thus only the address
> of the first can be programmed on the BMC-side. ASPEED supply documentation
> that maps the LPC-side register layout for given LPC IO base addresses. I think
> this is esoteric enough to warrant the aspeed prefix.
> 
>  Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt | 20 +++++---
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
