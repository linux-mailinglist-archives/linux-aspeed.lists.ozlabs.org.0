Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D558D460F
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 19:01:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qZ3t2y5bzDqch
	for <lists+linux-aspeed@lfdr.de>; Sat, 12 Oct 2019 04:01:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.196; helo=mail-oi1-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qZ3m2WqDzDqZG
 for <linux-aspeed@lists.ozlabs.org>; Sat, 12 Oct 2019 04:01:24 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id k20so8595983oih.3
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mZ12ktNjFYLHaQldgcLq5YbkCfRxwml6HBzJyQjPFcc=;
 b=pOs5WiTy3pRj5io8EQhhtdWUZFySjMGSFYnhVURH6bm6VmAOJmXH+E3ouOdEWafqay
 RTUkuPZ5McW2t1r5ix7V4U2+OqwAr4jH6Eo8un3/Uw5tfUTETrTXfKkv+jT+VKwRStCe
 yBHhikucdBZqmgblrr58mzsShEloDUpyB0QeRE/vGelOs9rsIhJ3xVsoWk7Ks4pj++8x
 SP37uG5IOGcrCrx8FyG+JvHi6HYo7dEvsq7cYYj09lXtNwihAFplZqGLa+ZFej6KoXij
 LDXQbaaxS6WiQ1gmCrBTjSq7RT01vIzLlFppH+tBaxsLrwbzVbMMwszzbu2tdnWkWar4
 gSdA==
X-Gm-Message-State: APjAAAUsC+tnlR/9RpfZhahhjp30XKeu/3iG/rZOmrcBi1Tw5kcGhNvR
 +XMUeXKgkHJjdPWLnitcaQ==
X-Google-Smtp-Source: APXvYqw+dKHsoqTOnX9vla/BlNQ96S8wiRdesNaBW3u1/5nYILYHP7qaKXZdqjpYAEGQlNkuonbBlA==
X-Received: by 2002:aca:f1d7:: with SMTP id
 p206mr12295309oih.119.1570813281285; 
 Fri, 11 Oct 2019 10:01:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e5sm2889559otr.81.2019.10.11.10.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 10:01:20 -0700 (PDT)
Date: Fri, 11 Oct 2019 12:01:20 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate
 definitions
Message-ID: <20191011170120.GA15442@bogus>
References: <20191010020725.3990-1-andrew@aj.id.au>
 <20191010020725.3990-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010020725.3990-2-andrew@aj.id.au>
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

On Thu, 10 Oct 2019 12:37:24 +1030, Andrew Jeffery wrote:
> The AST2600 has an explicit gate for the RMII RCLK for each of the four
> MACs.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
