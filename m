Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6BCDD30
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 09:53:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sxk73GFLzDqMr
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Apr 2019 17:53:51 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="bCja6Qsa"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sxk26WtpzDq9D
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 17:53:46 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id i31so2129822qti.13
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Apr 2019 00:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5t3ha+L/fYSXvu7o0ySbyVykauyPN6EAUxnPIHb4CJ0=;
 b=bCja6QsaoKBuddwyLN7Ymwyx1swIpERjorOwhUMNvQjppCPYWWn45unKFCXWw6v8NV
 tLMMy49XYA18pN+j2THaZlgHJgmRrmkZtLeKXFb2yDOhxo0pzsV/rC6ZTN5nUPEmrvxw
 H8Inbo6e5paggfmsXww73Z3oLs2/WZaWoI3H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5t3ha+L/fYSXvu7o0ySbyVykauyPN6EAUxnPIHb4CJ0=;
 b=RI2Jhn6jEpnbJMizw5tLrQSDuXPnOwQI3JErX+DQTYahMgWeFiT6+ytvAIHUP05AbF
 CRuQbJjTQ1iyANwhf2ZkaO3vU+fLUqfd414bbjPUSr/iKNSv52+W4jay4jHHVl9V/1Hb
 0SH0wdZRLuY6YZKZ1+xvH3eh4ezTkzI0+uaPWRIvzpIaZdy7lvfmrqjdMEn9G1U2kRFF
 9/rHuBRhOhBTw+v8HhfffrONpiDZhT6Q08mPtEmh8KQdbMtWd3RoV/7u6rDg1+sFESJC
 FBgT3bS0f/wwsFu6+AL/DKE+zjI+UaTq8HYCYU+sQaUV+qDHKuAZn0PA2Mn5T1tNQ0W8
 KgEA==
X-Gm-Message-State: APjAAAWg0qioS6SpJOtcaO0P/Vu46uK+2a5uKsa0A9CsUyYzylfyGC7B
 tfaMpPhcja9r+du4YPI2TlBolByPxtQk0O//ifI=
X-Google-Smtp-Source: APXvYqx48H9AYPZuMFrqfPObYS55llABgvbLwiFiYW98pm7xlm9uxMeurzruoh/LKxJaOVfxTRXM1+nMdxblh/TRCwg=
X-Received: by 2002:ac8:169b:: with SMTP id r27mr33552179qtj.235.1556524424431; 
 Mon, 29 Apr 2019 00:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190425194903.144569-1-venture@google.com>
In-Reply-To: <20190425194903.144569-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 07:53:31 +0000
Message-ID: <CACPK8XeDS0RfF1SSTuFbSoO9a7N6qDZShovj5yF56Pc9PA6nDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: quanta-q71: Enable p2a node
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, arm <arm@kernel.org>,
 linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 25 Apr 2019 at 19:49, Patrick Venture <venture@google.com> wrote:
>
> Enable the aspeed-p2a-ctrl node and configure with memory-region to
> enable mmap access.
>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to the aspeed SoC tree.

Cheers,

Joel
