Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5064963B76
	for <lists+linux-aspeed@lfdr.de>; Tue,  9 Jul 2019 20:55:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45js2s1CrPzDqWS
	for <lists+linux-aspeed@lfdr.de>; Wed, 10 Jul 2019 04:55:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="2hvgQEnO"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45js0R1NfTzDqVN
 for <linux-aspeed@lists.ozlabs.org>; Wed, 10 Jul 2019 04:53:26 +1000 (AEST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7286E2087F
 for <linux-aspeed@lists.ozlabs.org>; Tue,  9 Jul 2019 18:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562698404;
 bh=0ImkJUz3uR/+DVGq2bXGZLAIbe6zf2CjaYLEOlRY4ps=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2hvgQEnOPWC1SvHHrf8dXGJxWxD4yWceJdhi4hloTlumiiTegaZkuaI/tFneSFCDK
 3xeoJtlqtM5pHiqMQ3Mc7kzVGgFdQQZzikumbGqCF12E+X0WA3Aj7p9WbrTWsEAv7l
 g+RCorpwnDSB1brEdg6kE1alx6PSeliKzH9aqnSI=
Received: by mail-qt1-f169.google.com with SMTP id l9so14461181qtu.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 09 Jul 2019 11:53:24 -0700 (PDT)
X-Gm-Message-State: APjAAAVn6e1yfkvphF7B/Cu4xcmz2CD3Z5YCs/Wc1wUfLDVWQDE4akwb
 506/7QhM6q1Gbjw1PCSYWLhKW5luH61sC3ZjCg==
X-Google-Smtp-Source: APXvYqylibJKKbin92OddAtVOLNyjL4xzmkeD9zXAOF4W4EKSaAZ0cVt6KqwCFYn1XAIrYpKX6ExRt5TG60yMAb0li0=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr20147515qtf.110.1562698403737; 
 Tue, 09 Jul 2019 11:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 9 Jul 2019 12:53:12 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0z4OZ7qbaiUva1v5xCKXpsaPBZ9tj_M4HbEihsU_MfA@mail.gmail.com>
Message-ID: <CAL_Jsq+0z4OZ7qbaiUva1v5xCKXpsaPBZ9tj_M4HbEihsU_MfA@mail.gmail.com>
Subject: Re: [linux,dev-5.1 v1] dt-bindings: gpio: aspeed: Add SGPIO support
To: Hongwei Zhang <hongweiz@ami.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 3, 2019 at 2:01 PM Hongwei Zhang <hongweiz@ami.com> wrote:
>
> Add bindings to support SGPIO on AST2400 or AST2500.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 36 ++++++++++++++++++++++

Is this SGPIO as in the blinky lights for HDDs in servers? If so, that
has nothing to do with Linux GPIO subsystem.

BTW, You might want to look at Calxeda highbank SATA driver. It has a
bit-banged SGPIO interface using GPIO lines in it.


Rob
