Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD566151AD
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Nov 2022 19:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1zNn3sR8z3cLx
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Nov 2022 05:40:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.169; helo=mail-oi1-f169.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1zNg4kTCz3cGZ
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Nov 2022 05:40:35 +1100 (AEDT)
Received: by mail-oi1-f169.google.com with SMTP id c129so5039065oia.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 01 Nov 2022 11:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9hzjd9ZHijyciHnKdGg6ad5FqSz4oFo9jluuiQAUYc=;
        b=bN1oJzKuGZD4wkMNV4B4nnElTCAbkPu40D+C3c2g88OcrJ5v0Wwe63BX9Q1Y6GXEZj
         hSEzxRrtaIGEWbo5iKDUkXPbcEFPuVkLXJpmgvjcohH8B20uVJZsGJTVoT3WcbYYWv4W
         RBYxSBOEGpM5jR58GnVuVf9NsaOIWgZ5EkVrwAB/6CtOtg2sf1GRMU5kDeuxt3uMgQkt
         E0le+lWfxTTmD04H2bug8QRXZPBCk4VG/a8l5bBV+cJwcwamWzLl0O/rH8dwSiKa7gPr
         qw3Qtbq8zG/QTKaN3tb3bfpmBkV/4CU7AnqYvaoRuM8FRSvpvbV4sGEkPva1mUQp4Ivi
         flyQ==
X-Gm-Message-State: ACrzQf2WI80P5i/5uK21mt69Jtzro4U36+6H7lrEk3cvBovq7XfeIxqQ
	qzngSUpCCyezRc5yg2qrSQ==
X-Google-Smtp-Source: AMsMyM7OY/1BncaNebgnDhimX7u3Eh4GfMoUFZ38+wmSUfWGXZz7innDDugb8enD/+xkKsm+4iBR0Q==
X-Received: by 2002:a05:6808:1908:b0:35a:b52:7955 with SMTP id bf8-20020a056808190800b0035a0b527955mr6310195oib.177.1667328031904;
        Tue, 01 Nov 2022 11:40:31 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x1-20020a4ad041000000b004956ee06cadsm3677487oor.43.2022.11.01.11.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 11:40:31 -0700 (PDT)
Received: (nullmailer pid 1883701 invoked by uid 1000);
	Tue, 01 Nov 2022 18:40:33 -0000
Date: Tue, 1 Nov 2022 13:40:33 -0500
From: Rob Herring <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 1/3] dt-bindings: Add bindings for aspeed pwm-tach.
Message-ID: <20221101184033.GA1879756-robh@kernel.org>
References: <20221101095156.30591-1-billy_tsai@aspeedtech.com>
 <20221101095156.30591-2-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101095156.30591-2-billy_tsai@aspeedtech.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, garnermic@meta.com, jdelvare@suse.com, linux-aspeed@lists.ozlabs.org, linux-pwm@vger.kernel.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com, p.zabel@pengutronix.de, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Nov 01, 2022 at 05:51:54PM +0800, Billy Tsai wrote:
> This patch adds device binding for aspeed pwm-tach device which is a
> multi-function device include pwm and tach function and pwm/tach device
> bindings which should be the child-node of pwm-tach device.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/hwmon/aspeed,ast2600-tach.yaml   | 48 ++++++++++++
>  .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml | 76 +++++++++++++++++++
>  .../bindings/pwm/aspeed,ast2600-pwm.yaml      | 64 ++++++++++++++++
>  3 files changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
>  create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml

I'm pretty sure I've said this before, but I'm not taking more fan 
controller bindings without comming up with a common binding. Please see 
this series[1] and help ensure it meets your needs.

Rob

[1] https://lore.kernel.org/all/20221013094838.1529153-2-Naresh.Solanki@9elements.com/
