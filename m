Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F4FD4613
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 19:01:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qZ4D4wvLzDqZ3
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2019 04:01:48 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qZ474C3nzDqZG
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 04:01:43 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id k32so8563916otc.4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2k6iJvLdkfVozjkI9NSZfVogwjqk7AYxF3ZCmE3mp+M=;
 b=J5L7qYIAiXu7rbVnCo2xzZf/2GwTYxT5wcXBiaWkFsxd/S23GY7tEEFZw6ezLBc/7o
 U/ozm8hkES4WUfdenhLKAy/NYdkB9op9Gjkm4ihQNP02oqM/FpHZlRBPyNvkMfEL/ZcV
 qU1h5YtQABpQH5jcD8sAHu1yQncTBOSdoUlaSTF4AJCMF6YR5Wlnpxa5HIPyvoRyi/zz
 JlHekmxNh6Q1gAOk7vQggMv0UcbjFkHGP0/5LLepYdE5tropL8Naqh7chM0sTv/8pVps
 mqKgEMxvbLfI1fZKHy0/6EDIWPrsLaJdHxme1hLhYSC3FSROR3EXABrqN3MH9Ot9wDav
 2jig==
X-Gm-Message-State: APjAAAVFYZcBkapOPSKlNqfcrN/uQW5rXWOl1gQ20yc8L5YtAnd3/Dx7
 aMGUOtKtZsDq5AJj5+vg3w==
X-Google-Smtp-Source: APXvYqyxTCyx1p90Vg8GKWBh8CskGgy1s5uYdHxkKeWfkTkOSo8sUcAJXHydLulLRSMM841tjFMBmQ==
X-Received: by 2002:a9d:70c3:: with SMTP id w3mr7433016otj.246.1570813300970; 
 Fri, 11 Oct 2019 10:01:40 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u141sm2827663oie.40.2019.10.11.10.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 10:01:40 -0700 (PDT)
Date: Fri, 11 Oct 2019 12:01:39 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 1/3] dt-bindings: net: ftgmac100: Document AST2600
 compatible
Message-ID: <20191011170139.GA16006@bogus>
References: <20191010020756.4198-1-andrew@aj.id.au>
 <20191010020756.4198-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010020756.4198-2-andrew@aj.id.au>
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

On Thu, 10 Oct 2019 12:37:54 +1030, Andrew Jeffery wrote:
> The AST2600 contains an FTGMAC100-compatible MAC, although the MDIO
> controller previously embedded in the MAC has been moved out to a
> dedicated MDIO block.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/net/ftgmac100.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
