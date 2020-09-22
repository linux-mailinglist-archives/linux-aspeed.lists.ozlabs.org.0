Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07530274BFC
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Sep 2020 00:20:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwwjQ34f5zDqWY
	for <lists+linux-aspeed@lfdr.de>; Wed, 23 Sep 2020 08:20:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.65; helo=mail-io1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwwjH1L1ZzDqVl;
 Wed, 23 Sep 2020 08:20:03 +1000 (AEST)
Received: by mail-io1-f65.google.com with SMTP id u6so21434483iow.9;
 Tue, 22 Sep 2020 15:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PJgPG9nFqKSPj20PO+Q8aRuzKhCzolUfMEd72+sKZ5Y=;
 b=eHgLmjYEzC3CxlwXDJekv4QupifNAe9UMW44lGI/skV85Mk4f5tO9nn6XD0M+6Wa9P
 Bzx8/mSQauZ7DZJ5ucVCqlxXWvFJoPru8zRU0ivKPKHGbGszjRGOw6op8ew6+Ap611B0
 1V080v9QYWu/SlmG9Fgxkb5MBjneP4G9RsDlvb5X3hg+cqAxMm1/SMWAw9MoioKvqsup
 l09a3detLxUVFkvv9fewYlLBPaK27PsHlGwRwi+v54MyoYr66cXG/0QRsFnA5XG1B3tX
 L3eWlxhjfkYOltdk1aCNsuiTKULoVMv7pq4n1hpy2lBpn53TTRcnzo19rFULkq+wTnP6
 DlGg==
X-Gm-Message-State: AOAM530fHFXr+vdME0naW60I0S1qdKQHGCBp9paBN4PR2pNkfvi4hfCh
 XHi2iQydtCsEQNaIZm3z9w==
X-Google-Smtp-Source: ABdhPJwI8vrDQOMurbkEIJAIiMEuHNothuYJbyAYzDNUdEu7xESwerwBj5XmYNhkRLLhSI+/FWzz6g==
X-Received: by 2002:a02:1a83:: with SMTP id 125mr6048477jai.48.1600813200316; 
 Tue, 22 Sep 2020 15:20:00 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s1sm9701286iln.22.2020.09.22.15.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 15:19:59 -0700 (PDT)
Received: (nullmailer pid 3360327 invoked by uid 1000);
 Tue, 22 Sep 2020 22:19:58 -0000
Date: Tue, 22 Sep 2020 16:19:58 -0600
From: Rob Herring <robh@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 3/4] dt-bindings: fsi: Aspeed master: Add bus-frequency
 property
Message-ID: <20200922221958.GA3360267@bogus>
References: <20200910151840.25333-1-eajames@linux.ibm.com>
 <20200910151840.25333-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910151840.25333-4-eajames@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, jk@ozlabs.org,
 sboyd@kernel.org, alistair@popple.id.au, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-fsi@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Sep 2020 10:18:39 -0500, Eddie James wrote:
> Document the bus-frequency property.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
