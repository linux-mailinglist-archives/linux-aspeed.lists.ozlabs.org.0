Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A496A5856
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Sep 2019 15:47:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MWcN57tqzDqbW
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Sep 2019 23:47:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MWQV1RBbzDqcG
 for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Sep 2019 23:39:13 +1000 (AEST)
Received: by mail-wm1-f66.google.com with SMTP id t9so14651051wmi.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 02 Sep 2019 06:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=Ljep6bH+jK/y7KzX9TmuYtR3XGnID6enl5X5Nz5+kmY=;
 b=Qrt4ygErbxbSVin5CywCFet8WrOO2YHke59duefC2lOl6Ri0JCEfKgyb9JDuzLYXcy
 wA2yF+d4kzsNBltB085+gLoOX+2iZorMIytAF3Zu8gYExfCamPkMLxnaCi28vyHYXOw6
 zsSEnZ0sPtV98h9w75aVN8Bb+FkybGYfqudM/jr8s8ydM6HFPD1OOqcQm8kHYgXG5WGs
 UZ6WxF2f2vgj5SAZu5NkoIHn1XlvDy6bRm+bXfRU6nKgkLvHfgpm3Jz6alyjGgFqIj/U
 34i0wIuOzhWqFaUl6Ks5Virkypa9TdsBXK5HAiGZ9FZa07rc5SFlG9ewZxfdwF5fV1Mj
 oVjA==
X-Gm-Message-State: APjAAAWqZ/TSvaj96kjpAmOhLHE3iS12Xd0E2Be/Er2XkkL/rYaeoe61
 K1ZK3i61wW1cwTYOdcWOHA==
X-Google-Smtp-Source: APXvYqxpPvpnT9a93gVp+b7ar8pc3AEKNSZ5yS0Q62pduvGJgd3oF79YWeSiKcS4TSsXPrd6GYW4Nw==
X-Received: by 2002:a7b:c091:: with SMTP id r17mr33360948wmh.74.1567431549560; 
 Mon, 02 Sep 2019 06:39:09 -0700 (PDT)
Received: from localhost ([212.187.182.166])
 by smtp.gmail.com with ESMTPSA id m18sm5952612wrg.97.2019.09.02.06.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 06:39:08 -0700 (PDT)
Message-ID: <5d6d1b7c.1c69fb81.7f479.9ca6@mx.google.com>
Date: Mon, 02 Sep 2019 14:39:08 +0100
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: Document ibm,
 cffps2 compatible string
References: <1567192263-15065-1-git-send-email-eajames@linux.ibm.com>
 <1567192263-15065-2-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1567192263-15065-2-git-send-email-eajames@linux.ibm.com>
To: Eddie James <eajames@linux.ibm.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, linux@roeck-us.net
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019 14:11:01 -0500, Eddie James wrote:
> Document the compatible string for version 2 of the IBM CFFPS PSU.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/hwmon/ibm,cffps1.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

